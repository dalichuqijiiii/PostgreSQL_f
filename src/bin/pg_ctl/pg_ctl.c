/*-------------------------------------------------------------------------
 *
 * pg_ctl --- start/stops/restarts the PostgreSQL server
 *
 * Portions Copyright (c) 1996-2011, PostgreSQL Global Development Group
 *
 * src/bin/pg_ctl/pg_ctl.c
 *
 *-------------------------------------------------------------------------
 */

#ifdef WIN32
/*
 * Need this to get defines for restricted tokens and jobs. And it
 * has to be set before any header from the Win32 API is loaded.
 */
#define _WIN32_WINNT 0x0501
#endif

#include "postgres_fe.h"
#include "libpq-fe.h"

#include <locale.h>
#include <signal.h>
#include <time.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#ifdef HAVE_SYS_RESOURCE_H
#include <sys/time.h>
#include <sys/resource.h>
#endif

#include "libpq/pqsignal.h"
#include "getopt_long.h"
#include "miscadmin.h"

#if defined(__CYGWIN__)
#include <sys/cygwin.h>
#include <windows.h>
/* Cygwin defines WIN32 in windows.h, but we don't want it. */
#undef WIN32
#endif

/* PID can be negative for standalone backend */
typedef long pgpid_t;


typedef enum
{
	SMART_MODE,
	FAST_MODE,
	IMMEDIATE_MODE
} ShutdownMode;


typedef enum
{
	NO_COMMAND = 0,
	INIT_COMMAND,
	START_COMMAND,
	STOP_COMMAND,
	RESTART_COMMAND,
	PROMOTE_COMMAND,
	RELOAD_COMMAND,
	STATUS_COMMAND,
	KILL_COMMAND,
	REGISTER_COMMAND,
	UNREGISTER_COMMAND,
	RUN_AS_SERVICE_COMMAND
} CtlCommand;

#define DEFAULT_WAIT	60

static bool do_wait = false;
static bool wait_set = false;
static int	wait_seconds = DEFAULT_WAIT;
static bool silent_mode = false;
static ShutdownMode shutdown_mode = SMART_MODE;
static int	sig = SIGTERM;		/* default */
static CtlCommand ctl_command = NO_COMMAND;
static char *pg_data = NULL;
static char *pgdata_opt = NULL;
static char *post_opts = NULL;
static const char *progname;
static char *log_file = NULL;
static char *exec_path = NULL;
static char *register_servicename = "PostgreSQL";		/* FIXME: + version ID? */
static char *register_username = NULL;
static char *register_password = NULL;
static char *argv0 = NULL;
static bool allow_core_files = false;
static time_t start_time;

static char postopts_file[MAXPGPATH];
static char pid_file[MAXPGPATH];
static char backup_file[MAXPGPATH];
static char recovery_file[MAXPGPATH];
static char promote_file[MAXPGPATH];

#if defined(WIN32) || defined(__CYGWIN__)
static DWORD pgctl_start_type = SERVICE_AUTO_START;
static SERVICE_STATUS status;
static SERVICE_STATUS_HANDLE hStatus = (SERVICE_STATUS_HANDLE) 0;
static HANDLE shutdownHandles[2];
static pid_t postmasterPID = -1;

#define shutdownEvent	  shutdownHandles[0]
#define postmasterProcess shutdownHandles[1]
#endif


static void
write_stderr(const char *fmt,...)
/* This extension allows gcc to check the format string for consistency with
   the supplied arguments. */
__attribute__((format(printf, 1, 2)));
static void *pg_malloc(size_t size);
static char *xstrdup(const char *s);
static void do_advice(void);
static void do_help(void);
static void set_mode(char *modeopt);
static void set_sig(char *signame);
static void do_init(void);
static void do_start(void);
static void do_stop(void);
static void do_restart(void);
static void do_promote(void);
static void do_reload(void);
static void do_status(void);
static void do_kill(pgpid_t pid);
static void print_msg(const char *msg);

#if defined(WIN32) || defined(__CYGWIN__)
static bool pgwin32_IsInstalled(SC_HANDLE);
static char *pgwin32_CommandLine(bool);
static void pgwin32_doRegister(void);
static void pgwin32_doUnregister(void);
static void pgwin32_SetServiceStatus(DWORD);
static void WINAPI pgwin32_ServiceHandler(DWORD);
static void WINAPI pgwin32_ServiceMain(DWORD, LPTSTR *);
static void pgwin32_doRunAsService(void);
static int	CreateRestrictedProcess(char *cmd, PROCESS_INFORMATION *processInfo, bool as_service);
#endif

static pgpid_t get_pgpid(void);
static char **readfile(const char *path);
static int	start_postmaster(void);
static void read_post_opts(void);

static PGPing test_postmaster_connection(bool);
static bool postmaster_is_alive(pid_t pid);

#if defined(HAVE_GETRLIMIT) && defined(RLIMIT_CORE)
static void unlimit_core_size(void);
#endif


#if defined(WIN32) || defined(__CYGWIN__)
static void
write_eventlog(int level, const char *line)
{
	static HANDLE evtHandle = INVALID_HANDLE_VALUE;

	if (evtHandle == INVALID_HANDLE_VALUE)
	{
		evtHandle = RegisterEventSource(NULL, "PostgreSQL");
		if (evtHandle == NULL)
		{
			evtHandle = INVALID_HANDLE_VALUE;
			return;
		}
	}

	ReportEvent(evtHandle,
				level,
				0,
				0,				/* All events are Id 0 */
				NULL,
				1,
				0,
				&line,
				NULL);
}
#endif

/*
 * Write errors to stderr (or by equal means when stderr is
 * not available).
 */
static void
write_stderr(const char *fmt,...)
{
	va_list		ap;

	va_start(ap, fmt);
#if !defined(WIN32) && !defined(__CYGWIN__)
	/* On Unix, we just fprintf to stderr */
	vfprintf(stderr, fmt, ap);
#else

	/*
	 * On Win32, we print to stderr if running on a console, or write to
	 * eventlog if running as a service
	 */
	if (!isatty(fileno(stderr)))	/* Running as a service */
	{
		char		errbuf[2048];		/* Arbitrary size? */

		vsnprintf(errbuf, sizeof(errbuf), fmt, ap);

		write_eventlog(EVENTLOG_ERROR_TYPE, errbuf);
	}
	else
		/* Not running as service, write to stderr */
		vfprintf(stderr, fmt, ap);
#endif
	va_end(ap);
}

/*
 * routines to check memory allocations and fail noisily.
 */

static void *
pg_malloc(size_t size)
{
	void	   *result;

	result = malloc(size);
	if (!result)
	{
		write_stderr(_("%s: out of memory\n"), progname);
		exit(1);
	}
	return result;
}


static char *
xstrdup(const char *s)
{
	char	   *result;

	result = strdup(s);
	if (!result)
	{
		write_stderr(_("%s: out of memory\n"), progname);
		exit(1);
	}
	return result;
}

/*
 * Given an already-localized string, print it to stdout unless the
 * user has specified that no messages should be printed.
 */
static void
print_msg(const char *msg)
{
	if (!silent_mode)
	{
		fputs(msg, stdout);
		fflush(stdout);
	}
}

static pgpid_t
get_pgpid(void)
{
	FILE	   *pidf;
	long		pid;

	pidf = fopen(pid_file, "r");
	if (pidf == NULL)
	{
		/* No pid file, not an error on startup */
		if (errno == ENOENT)
			return 0;
		else
		{
			write_stderr(_("%s: could not open PID file \"%s\": %s\n"),
						 progname, pid_file, strerror(errno));
			exit(1);
		}
	}
	if (fscanf(pidf, "%ld", &pid) != 1)
	{
		write_stderr(_("%s: invalid data in PID file \"%s\"\n"),
					 progname, pid_file);
		exit(1);
	}
	fclose(pidf);
	return (pgpid_t) pid;
}


/*
 * get the lines from a text file - return NULL if file can't be opened
 */
static char **
readfile(const char *path)
{
	FILE	   *infile;
	int			maxlength = 1,
				linelen = 0;
	int			nlines = 0;
	char	  **result;
	char	   *buffer;
	int			c;

	if ((infile = fopen(path, "r")) == NULL)
		return NULL;

	/* pass over the file twice - the first time to size the result */

	while ((c = fgetc(infile)) != EOF)
	{
		linelen++;
		if (c == '\n')
		{
			nlines++;
			if (linelen > maxlength)
				maxlength = linelen;
			linelen = 0;
		}
	}

	/* handle last line without a terminating newline (yuck) */
	if (linelen)
		nlines++;
	if (linelen > maxlength)
		maxlength = linelen;

	/* set up the result and the line buffer */
	result = (char **) pg_malloc((nlines + 1) * sizeof(char *));
	buffer = (char *) pg_malloc(maxlength + 1);

	/* now reprocess the file and store the lines */
	rewind(infile);
	nlines = 0;
	while (fgets(buffer, maxlength + 1, infile) != NULL)
		result[nlines++] = xstrdup(buffer);

	fclose(infile);
	free(buffer);
	result[nlines] = NULL;

	return result;
}



/*
 * start/test/stop routines
 */

static int
start_postmaster(void)
{
	char		cmd[MAXPGPATH];

#ifndef WIN32

	/*
	 * Since there might be quotes to handle here, it is easier simply to pass
	 * everything to a shell to process them.
	 */
	if (log_file != NULL)
		snprintf(cmd, MAXPGPATH, SYSTEMQUOTE "\"%s\" %s%s < \"%s\" >> \"%s\" 2>&1 &" SYSTEMQUOTE,
				 exec_path, pgdata_opt, post_opts,
				 DEVNULL, log_file);
	else
		snprintf(cmd, MAXPGPATH, SYSTEMQUOTE "\"%s\" %s%s < \"%s\" 2>&1 &" SYSTEMQUOTE,
				 exec_path, pgdata_opt, post_opts, DEVNULL);

	return system(cmd);
#else							/* WIN32 */

	/*
	 * On win32 we don't use system(). So we don't need to use & (which would
	 * be START /B on win32). However, we still call the shell (CMD.EXE) with
	 * it to handle redirection etc.
	 */
	PROCESS_INFORMATION pi;

	if (log_file != NULL)
		snprintf(cmd, MAXPGPATH, "CMD /C " SYSTEMQUOTE "\"%s\" %s%s < \"%s\" >> \"%s\" 2>&1" SYSTEMQUOTE,
				 exec_path, pgdata_opt, post_opts, DEVNULL, log_file);
	else
		snprintf(cmd, MAXPGPATH, "CMD /C " SYSTEMQUOTE "\"%s\" %s%s < \"%s\" 2>&1" SYSTEMQUOTE,
				 exec_path, pgdata_opt, post_opts, DEVNULL);

	if (!CreateRestrictedProcess(cmd, &pi, false))
		return GetLastError();
	CloseHandle(pi.hProcess);
	CloseHandle(pi.hThread);
	return 0;
#endif   /* WIN32 */
}



/*
 * Find the pgport and try a connection
 *
 * Note that the checkpoint parameter enables a Windows service control
 * manager checkpoint, it's got nothing to do with database checkpoints!!
 */
static PGPing
test_postmaster_connection(bool do_checkpoint)
{
	PGPing		ret = PQPING_OK;	/* assume success for wait == zero */
	char		connstr[MAXPGPATH * 2 + 256];
	int			i;

	connstr[0] = '\0';

	for (i = 0; i < wait_seconds; i++)
	{
		/* Do we need a connection string? */
		if (connstr[0] == '\0')
		{
			/*----------
			 * The number of lines in postmaster.pid tells us several things:
			 *
			 * # of lines
			 *		0	lock file created but status not written
			 *		2	pre-9.1 server, shared memory not created
			 *		3	pre-9.1 server, shared memory created
			 *		5	9.1+ server, ports not opened
			 *		6	9.1+ server, shared memory not created
			 *		7	9.1+ server, shared memory created
			 *
			 * This code does not support pre-9.1 servers.	On Unix machines
			 * we could consider extracting the port number from the shmem
			 * key, but that (a) is not robust, and (b) doesn't help with
			 * finding out the socket directory.  And it wouldn't work anyway
			 * on Windows.
			 *
			 * If we see less than 6 lines in postmaster.pid, just keep
			 * waiting.
			 *----------
			 */
			char	  **optlines;

			/* Try to read the postmaster.pid file */
			if ((optlines = readfile(pid_file)) != NULL &&
				optlines[0] != NULL &&
				optlines[1] != NULL &&
				optlines[2] != NULL)
			{
				if (optlines[3] == NULL)
				{
					/* File is exactly three lines, must be pre-9.1 */
					write_stderr(_("%s: -w option is not supported when starting a pre-9.1 server\n"),
								 progname);
					return PQPING_NO_ATTEMPT;
				}
				else if (optlines[4] != NULL &&
						 optlines[5] != NULL)
				{
					/* File is complete enough for us, parse it */
					time_t		pmstart;
					int			portnum;
					char	   *sockdir;
					char	   *hostaddr;
					char		host_str[MAXPGPATH];

					/*
					 * Easy cross-check that we are looking at the right data
					 * directory: is the postmaster older than this execution
					 * of pg_ctl?  Subtract 2 seconds to allow for possible
					 * clock skew between pg_ctl and the postmaster.
					 */
					pmstart = atol(optlines[LOCK_FILE_LINE_START_TIME - 1]);
					if (pmstart < start_time - 2)
					{
						write_stderr(_("%s: this data directory is running a pre-existing postmaster\n"),
									 progname);
						return PQPING_NO_ATTEMPT;
					}

					/*
					 * OK, extract port number and host string to use. Prefer
					 * using Unix socket if available.
					 */
					portnum = atoi(optlines[LOCK_FILE_LINE_PORT - 1]);

					sockdir = optlines[LOCK_FILE_LINE_SOCKET_DIR - 1];
					hostaddr = optlines[LOCK_FILE_LINE_LISTEN_ADDR - 1];

					/*
					 * While unix_socket_directory can accept relative
					 * directories, libpq's host parameter must have a leading
					 * slash to indicate a socket directory.  So, ignore
					 * sockdir if it's relative, and try to use TCP instead.
					 */
					if (sockdir[0] == '/')
						strlcpy(host_str, sockdir, sizeof(host_str));
					else
						strlcpy(host_str, hostaddr, sizeof(host_str));

					/* remove trailing newline */
					if (strchr(host_str, '\n') != NULL)
						*strchr(host_str, '\n') = '\0';

					/* Fail if we couldn't get either sockdir or host addr */
					if (host_str[0] == '\0')
					{
						write_stderr(_("%s: -w option cannot use a relative socket directory specification\n"),
									 progname);
						return PQPING_NO_ATTEMPT;
					}

					/* If postmaster is listening on "*", use "localhost" */
					if (strcmp(host_str, "*") == 0)
						strcpy(host_str, "localhost");

					/*
					 * We need to set connect_timeout otherwise on Windows the
					 * Service Control Manager (SCM) will probably timeout
					 * first.
					 */
					snprintf(connstr, sizeof(connstr),
					   "dbname=postgres port=%d host='%s' connect_timeout=5",
							 portnum, host_str);
				}
			}
		}

		/* If we have a connection string, ping the server */
		if (connstr[0] != '\0')
		{
			ret = PQping(connstr);
			if (ret == PQPING_OK || ret == PQPING_NO_ATTEMPT)
				break;
		}

		/* No response, or startup still in process; wait */
#if defined(WIN32)
		if (do_checkpoint)
		{
			/*
			 * Increment the wait hint by 6 secs (connection timeout + sleep)
			 * We must do this to indicate to the SCM that our startup time is
			 * changing, otherwise it'll usually send a stop signal after 20
			 * seconds, despite incrementing the checkpoint counter.
			 */
			status.dwWaitHint += 6000;
			status.dwCheckPoint++;
			SetServiceStatus(hStatus, (LPSERVICE_STATUS) &status);
		}
		else
#endif
			print_msg(".");

		pg_usleep(1000000);		/* 1 sec */
	}

	/* return result of last call to PQping */
	return ret;
}


#if defined(HAVE_GETRLIMIT) && defined(RLIMIT_CORE)
static void
unlimit_core_size(void)
{
	struct rlimit lim;

	getrlimit(RLIMIT_CORE, &lim);
	if (lim.rlim_max == 0)
	{
		write_stderr(_("%s: cannot set core file size limit; disallowed by hard limit\n"),
					 progname);
		return;
	}
	else if (lim.rlim_max == RLIM_INFINITY || lim.rlim_cur < lim.rlim_max)
	{
		lim.rlim_cur = lim.rlim_max;
		setrlimit(RLIMIT_CORE, &lim);
	}
}
#endif

static void
read_post_opts(void)
{
	if (post_opts == NULL)
	{
		post_opts = "";			/* default */
		if (ctl_command == RESTART_COMMAND)
		{
			char	  **optlines;

			optlines = readfile(postopts_file);
			if (optlines == NULL)
			{
				write_stderr(_("%s: could not read file \"%s\"\n"), progname, postopts_file);
				exit(1);
			}
			else if (optlines[0] == NULL || optlines[1] != NULL)
			{
				write_stderr(_("%s: option file \"%s\" must have exactly one line\n"),
							 progname, postopts_file);
				exit(1);
			}
			else
			{
				int			len;
				char	   *optline;
				char	   *arg1;

				optline = optlines[0];
				/* trim off line endings */
				len = strcspn(optline, "\r\n");
				optline[len] = '\0';

				/*
				 * Are we at the first option, as defined by space and
				 * double-quote?
				 */
				if ((arg1 = strstr(optline, " \"")) != NULL)
				{
					*arg1 = '\0';		/* terminate so we get only program
										 * name */
					post_opts = arg1 + 1;		/* point past whitespace */
				}
				if (exec_path == NULL)
					exec_path = optline;
			}
		}
	}
}

static char *
find_other_exec_or_die(const char *argv0, const char *target, const char *versionstr)
{
	int			ret;
	char	   *found_path;

	found_path = pg_malloc(MAXPGPATH);

	if ((ret = find_other_exec(argv0, target, versionstr, found_path)) < 0)
	{
		char		full_path[MAXPGPATH];

		if (find_my_exec(argv0, full_path) < 0)
			strlcpy(full_path, progname, sizeof(full_path));

		if (ret == -1)
			write_stderr(_("The program \"%s\" is needed by %s "
						   "but was not found in the\n"
						   "same directory as \"%s\".\n"
						   "Check your installation.\n"),
						 target, progname, full_path);
		else
			write_stderr(_("The program \"%s\" was found by \"%s\"\n"
						   "but was not the same version as %s.\n"
						   "Check your installation.\n"),
						 target, full_path, progname);
		exit(1);
	}

	return found_path;
}

static void
do_init(void)
{
	char		cmd[MAXPGPATH];

	if (exec_path == NULL)
		exec_path = find_other_exec_or_die(argv0, "initdb", "initdb (PostgreSQL) " PG_VERSION "\n");

	if (pgdata_opt == NULL)
		pgdata_opt = "";

	if (post_opts == NULL)
		post_opts = "";

	if (!silent_mode)
		snprintf(cmd, MAXPGPATH, SYSTEMQUOTE "\"%s\" %s%s" SYSTEMQUOTE,
				 exec_path, pgdata_opt, post_opts);
	else
		snprintf(cmd, MAXPGPATH, SYSTEMQUOTE "\"%s\" %s%s > \"%s\"" SYSTEMQUOTE,
				 exec_path, pgdata_opt, post_opts, DEVNULL);

	if (system(cmd) != 0)
	{
		write_stderr(_("%s: database system initialization failed\n"), progname);
		exit(1);
	}
}

static void
do_start(void)
{
	pgpid_t		pid;
	pgpid_t		old_pid = 0;
	int			exitcode;

	if (ctl_command != RESTART_COMMAND)
	{
		old_pid = get_pgpid();
		if (old_pid != 0)
			write_stderr(_("%s: another server might be running; "
						   "trying to start server anyway\n"),
						 progname);
	}

	read_post_opts();

	/* No -D or -D already added during server start */
	if (ctl_command == RESTART_COMMAND || pgdata_opt == NULL)
		pgdata_opt = "";

	if (exec_path == NULL)
		exec_path = find_other_exec_or_die(argv0, "postgres", PG_BACKEND_VERSIONSTR);

#if defined(HAVE_GETRLIMIT) && defined(RLIMIT_CORE)
	if (allow_core_files)
		unlimit_core_size();
#endif

	/*
	 * If possible, tell the postmaster our parent shell's PID (see the
	 * comments in CreateLockFile() for motivation).  Windows hasn't got
	 * getppid() unfortunately.
	 */
#ifndef WIN32
	{
		static char env_var[32];

		snprintf(env_var, sizeof(env_var), "PG_GRANDPARENT_PID=%d",
				 (int) getppid());
		putenv(env_var);
	}
#endif

	exitcode = start_postmaster();
	if (exitcode != 0)
	{
		write_stderr(_("%s: could not start server: exit code was %d\n"),
					 progname, exitcode);
		exit(1);
	}

	if (old_pid != 0)
	{
		pg_usleep(1000000);
		pid = get_pgpid();
		if (pid == old_pid)
		{
			write_stderr(_("%s: could not start server\n"
						   "Examine the log output.\n"),
						 progname);
			exit(1);
		}
	}

	if (do_wait)
	{
		print_msg(_("waiting for server to start..."));

		switch (test_postmaster_connection(false))
		{
			case PQPING_OK:
				print_msg(_(" done\n"));
				print_msg(_("server started\n"));
				break;
			case PQPING_REJECT:
				print_msg(_(" stopped waiting\n"));
				print_msg(_("server is still starting up\n"));
				break;
			case PQPING_NO_RESPONSE:
				print_msg(_(" stopped waiting\n"));
				write_stderr(_("%s: could not start server\n"
							   "Examine the log output.\n"),
							 progname);
				exit(1);
				break;
			case PQPING_NO_ATTEMPT:
				print_msg(_(" failed\n"));
				write_stderr(_("%s: could not wait for server because of misconfiguration\n"),
							 progname);
				exit(1);
		}
	}
	else
		print_msg(_("server starting\n"));
}


static void
do_stop(void)
{
	int			cnt;
	pgpid_t		pid;
	struct stat statbuf;

	pid = get_pgpid();

	if (pid == 0)				/* no pid file */
	{
		write_stderr(_("%s: PID file \"%s\" does not exist\n"), progname, pid_file);
		write_stderr(_("Is server running?\n"));
		exit(1);
	}
	else if (pid < 0)			/* standalone backend, not postmaster */
	{
		pid = -pid;
		write_stderr(_("%s: cannot stop server; "
					   "single-user server is running (PID: %ld)\n"),
					 progname, pid);
		exit(1);
	}

	if (kill((pid_t) pid, sig) != 0)
	{
		write_stderr(_("%s: could not send stop signal (PID: %ld): %s\n"), progname, pid,
					 strerror(errno));
		exit(1);
	}

	if (!do_wait)
	{
		print_msg(_("server shutting down\n"));
		return;
	}
	else
	{
		/*
		 * If backup_label exists, an online backup is running. Warn the user
		 * that smart shutdown will wait for it to finish. However, if
		 * recovery.conf is also present, we're recovering from an online
		 * backup instead of performing one.
		 */
		if (shutdown_mode == SMART_MODE &&
			stat(backup_file, &statbuf) == 0 &&
			stat(recovery_file, &statbuf) != 0)
		{
			print_msg(_("WARNING: online backup mode is active\n"
						"Shutdown will not complete until pg_stop_backup() is called.\n\n"));
		}

		print_msg(_("waiting for server to shut down..."));

		for (cnt = 0; cnt < wait_seconds; cnt++)
		{
			if ((pid = get_pgpid()) != 0)
			{
				print_msg(".");
				pg_usleep(1000000);		/* 1 sec */
			}
			else
				break;
		}

		if (pid != 0)			/* pid file still exists */
		{
			print_msg(_(" failed\n"));

			write_stderr(_("%s: server does not shut down\n"), progname);
			if (shutdown_mode == SMART_MODE)
				write_stderr(_("HINT: The \"-m fast\" option immediately disconnects sessions rather than\n"
						  "waiting for session-initiated disconnection.\n"));
			exit(1);
		}
		print_msg(_(" done\n"));

		print_msg(_("server stopped\n"));
	}
}


/*
 *	restart/promote/reload routines
 */

static void
do_restart(void)
{
	int			cnt;
	pgpid_t		pid;
	struct stat statbuf;

	pid = get_pgpid();

	if (pid == 0)				/* no pid file */
	{
		write_stderr(_("%s: PID file \"%s\" does not exist\n"),
					 progname, pid_file);
		write_stderr(_("Is server running?\n"));
		write_stderr(_("starting server anyway\n"));
		do_start();
		return;
	}
	else if (pid < 0)			/* standalone backend, not postmaster */
	{
		pid = -pid;
		if (postmaster_is_alive((pid_t) pid))
		{
			write_stderr(_("%s: cannot restart server; "
						   "single-user server is running (PID: %ld)\n"),
						 progname, pid);
			write_stderr(_("Please terminate the single-user server and try again.\n"));
			exit(1);
		}
	}

	if (postmaster_is_alive((pid_t) pid))
	{
		if (kill((pid_t) pid, sig) != 0)
		{
			write_stderr(_("%s: could not send stop signal (PID: %ld): %s\n"), progname, pid,
						 strerror(errno));
			exit(1);
		}

		/*
		 * If backup_label exists, an online backup is running. Warn the user
		 * that smart shutdown will wait for it to finish. However, if
		 * recovery.conf is also present, we're recovering from an online
		 * backup instead of performing one.
		 */
		if (shutdown_mode == SMART_MODE &&
			stat(backup_file, &statbuf) == 0 &&
			stat(recovery_file, &statbuf) != 0)
		{
			print_msg(_("WARNING: online backup mode is active\n"
						"Shutdown will not complete until pg_stop_backup() is called.\n\n"));
		}

		print_msg(_("waiting for server to shut down..."));

		/* always wait for restart */

		for (cnt = 0; cnt < wait_seconds; cnt++)
		{
			if ((pid = get_pgpid()) != 0)
			{
				print_msg(".");
				pg_usleep(1000000);		/* 1 sec */
			}
			else
				break;
		}

		if (pid != 0)			/* pid file still exists */
		{
			print_msg(_(" failed\n"));

			write_stderr(_("%s: server does not shut down\n"), progname);
			if (shutdown_mode == SMART_MODE)
				write_stderr(_("HINT: The \"-m fast\" option immediately disconnects sessions rather than\n"
						  "waiting for session-initiated disconnection.\n"));
			exit(1);
		}

		print_msg(_(" done\n"));
		print_msg(_("server stopped\n"));
	}
	else
	{
		write_stderr(_("%s: old server process (PID: %ld) seems to be gone\n"),
					 progname, pid);
		write_stderr(_("starting server anyway\n"));
	}

	do_start();
}

static void
do_promote(void)
{
	FILE	   *prmfile;
	pgpid_t		pid;
	struct stat statbuf;

	pid = get_pgpid();

	if (pid == 0)				/* no pid file */
	{
		write_stderr(_("%s: PID file \"%s\" does not exist\n"), progname, pid_file);
		write_stderr(_("Is server running?\n"));
		exit(1);
	}
	else if (pid < 0)			/* standalone backend, not postmaster */
	{
		pid = -pid;
		write_stderr(_("%s: cannot promote server; "
					   "single-user server is running (PID: %ld)\n"),
					 progname, pid);
		exit(1);
	}

	/* If recovery.conf doesn't exist, the server is not in standby mode */
	if (stat(recovery_file, &statbuf) != 0)
	{
		write_stderr(_("%s: cannot promote server; "
					   "server is not in standby mode\n"),
					 progname);
		exit(1);
	}

	if ((prmfile = fopen(promote_file, "w")) == NULL)
	{
		write_stderr(_("%s: could not create promote signal file \"%s\": %s\n"),
					 progname, promote_file, strerror(errno));
		exit(1);
	}
	if (fclose(prmfile))
	{
		write_stderr(_("%s: could not write promote signal file \"%s\": %s\n"),
					 progname, promote_file, strerror(errno));
		exit(1);
	}

	sig = SIGUSR1;
	if (kill((pid_t) pid, sig) != 0)
	{
		write_stderr(_("%s: could not send promote signal (PID: %ld): %s\n"),
					 progname, pid, strerror(errno));
		if (unlink(promote_file) != 0)
			write_stderr(_("%s: could not remove promote signal file \"%s\": %s\n"),
						 progname, promote_file, strerror(errno));
		exit(1);
	}

	print_msg(_("server promoting\n"));
}


static void
do_reload(void)
{
	pgpid_t		pid;

	pid = get_pgpid();
	if (pid == 0)				/* no pid file */
	{
		write_stderr(_("%s: PID file \"%s\" does not exist\n"), progname, pid_file);
		write_stderr(_("Is server running?\n"));
		exit(1);
	}
	else if (pid < 0)			/* standalone backend, not postmaster */
	{
		pid = -pid;
		write_stderr(_("%s: cannot reload server; "
					   "single-user server is running (PID: %ld)\n"),
					 progname, pid);
		write_stderr(_("Please terminate the single-user server and try again.\n"));
		exit(1);
	}

	if (kill((pid_t) pid, sig) != 0)
	{
		write_stderr(_("%s: could not send reload signal (PID: %ld): %s\n"),
					 progname, pid, strerror(errno));
		exit(1);
	}

	print_msg(_("server signaled\n"));
}

/*
 *	utility routines
 */

static bool
postmaster_is_alive(pid_t pid)
{
	/*
	 * Test to see if the process is still there.  Note that we do not
	 * consider an EPERM failure to mean that the process is still there;
	 * EPERM must mean that the given PID belongs to some other userid, and
	 * considering the permissions on $PGDATA, that means it's not the
	 * postmaster we are after.
	 *
	 * Don't believe that our own PID or parent shell's PID is the postmaster,
	 * either.	(Windows hasn't got getppid(), though.)
	 */
	if (pid == getpid())
		return false;
#ifndef WIN32
	if (pid == getppid())
		return false;
#endif
	if (kill(pid, 0) == 0)
		return true;
	return false;
}

static void
do_status(void)
{
	pgpid_t		pid;

	pid = get_pgpid();
	if (pid != 0)				/* 0 means no pid file */
	{
		if (pid < 0)			/* standalone backend */
		{
			pid = -pid;
			if (postmaster_is_alive((pid_t) pid))
			{
				printf(_("%s: single-user server is running (PID: %ld)\n"),
					   progname, pid);
				return;
			}
		}
		else
			/* postmaster */
		{
			if (postmaster_is_alive((pid_t) pid))
			{
				char	  **optlines;

				printf(_("%s: server is running (PID: %ld)\n"),
					   progname, pid);

				optlines = readfile(postopts_file);
				if (optlines != NULL)
					for (; *optlines != NULL; optlines++)
						fputs(*optlines, stdout);
				return;
			}
		}
	}
	printf(_("%s: no server running\n"), progname);
	exit(1);
}



static void
do_kill(pgpid_t pid)
{
	if (kill((pid_t) pid, sig) != 0)
	{
		write_stderr(_("%s: could not send signal %d (PID: %ld): %s\n"),
					 progname, sig, pid, strerror(errno));
		exit(1);
	}
}

#if defined(WIN32) || defined(__CYGWIN__)

static bool
pgwin32_IsInstalled(SC_HANDLE hSCM)
{
	SC_HANDLE	hService = OpenService(hSCM, register_servicename, SERVICE_QUERY_CONFIG);
	bool		bResult = (hService != NULL);

	if (bResult)
		CloseServiceHandle(hService);
	return bResult;
}

static char *
pgwin32_CommandLine(bool registration)
{
	static char cmdLine[MAXPGPATH];
	int			ret;

#ifdef __CYGWIN__
	char		buf[MAXPGPATH];
#endif

	if (registration)
	{
		ret = find_my_exec(argv0, cmdLine);
		if (ret != 0)
		{
			write_stderr(_("%s: could not find own program executable\n"), progname);
			exit(1);
		}
	}
	else
	{
		ret = find_other_exec(argv0, "postgres", PG_BACKEND_VERSIONSTR,
							  cmdLine);
		if (ret != 0)
		{
			write_stderr(_("%s: could not find postgres program executable\n"), progname);
			exit(1);
		}
	}

#ifdef __CYGWIN__
	/* need to convert to windows path */
#if CYGWIN_VERSION_DLL_MAJOR >= 1007
	cygwin_conv_path(CCP_POSIX_TO_WIN_A, cmdLine, buf, sizeof(buf));
#else
	cygwin_conv_to_full_win32_path(cmdLine, buf);
#endif
	strcpy(cmdLine, buf);
#endif

	if (registration)
	{
		if (pg_strcasecmp(cmdLine + strlen(cmdLine) - 4, ".exe"))
		{
			/* If commandline does not end in .exe, append it */
			strcat(cmdLine, ".exe");
		}
		strcat(cmdLine, " runservice -N \"");
		strcat(cmdLine, register_servicename);
		strcat(cmdLine, "\"");
	}

	if (pg_data)
	{
		strcat(cmdLine, " -D \"");
		strcat(cmdLine, pg_data);
		strcat(cmdLine, "\"");
	}

	if (registration && do_wait)
		strcat(cmdLine, " -w");

	if (registration && wait_seconds != DEFAULT_WAIT)
		/* concatenate */
		sprintf(cmdLine + strlen(cmdLine), " -t %d", wait_seconds);

	if (post_opts)
	{
		strcat(cmdLine, " ");
		if (registration)
			strcat(cmdLine, " -o \"");
		strcat(cmdLine, post_opts);
		if (registration)
			strcat(cmdLine, "\"");
	}

	return cmdLine;
}

static void
pgwin32_doRegister(void)
{
	SC_HANDLE	hService;
	SC_HANDLE	hSCM = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);

	if (hSCM == NULL)
	{
		write_stderr(_("%s: could not open service manager\n"), progname);
		exit(1);
	}
	if (pgwin32_IsInstalled(hSCM))
	{
		CloseServiceHandle(hSCM);
		write_stderr(_("%s: service \"%s\" already registered\n"), progname, register_servicename);
		exit(1);
	}

	if ((hService = CreateService(hSCM, register_servicename, register_servicename,
							   SERVICE_ALL_ACCESS, SERVICE_WIN32_OWN_PROCESS,
								  pgctl_start_type, SERVICE_ERROR_NORMAL,
								  pgwin32_CommandLine(true),
	   NULL, NULL, "RPCSS\0", register_username, register_password)) == NULL)
	{
		CloseServiceHandle(hSCM);
		write_stderr(_("%s: could not register service \"%s\": error code %d\n"), progname, register_servicename, (int) GetLastError());
		exit(1);
	}
	CloseServiceHandle(hService);
	CloseServiceHandle(hSCM);
}

static void
pgwin32_doUnregister(void)
{
	SC_HANDLE	hService;
	SC_HANDLE	hSCM = OpenSCManager(NULL, NULL, SC_MANAGER_ALL_ACCESS);

	if (hSCM == NULL)
	{
		write_stderr(_("%s: could not open service manager\n"), progname);
		exit(1);
	}
	if (!pgwin32_IsInstalled(hSCM))
	{
		CloseServiceHandle(hSCM);
		write_stderr(_("%s: service \"%s\" not registered\n"), progname, register_servicename);
		exit(1);
	}

	if ((hService = OpenService(hSCM, register_servicename, DELETE)) == NULL)
	{
		CloseServiceHandle(hSCM);
		write_stderr(_("%s: could not open service \"%s\": error code %d\n"), progname, register_servicename, (int) GetLastError());
		exit(1);
	}
	if (!DeleteService(hService))
	{
		CloseServiceHandle(hService);
		CloseServiceHandle(hSCM);
		write_stderr(_("%s: could not unregister service \"%s\": error code %d\n"), progname, register_servicename, (int) GetLastError());
		exit(1);
	}
	CloseServiceHandle(hService);
	CloseServiceHandle(hSCM);
}

static void
pgwin32_SetServiceStatus(DWORD currentState)
{
	status.dwCurrentState = currentState;
	SetServiceStatus(hStatus, (LPSERVICE_STATUS) &status);
}

static void WINAPI
pgwin32_ServiceHandler(DWORD request)
{
	switch (request)
	{
		case SERVICE_CONTROL_STOP:
		case SERVICE_CONTROL_SHUTDOWN:

			/*
			 * We only need a short wait hint here as it just needs to wait
			 * for the next checkpoint. They occur every 5 seconds during
			 * shutdown
			 */
			status.dwWaitHint = 10000;
			pgwin32_SetServiceStatus(SERVICE_STOP_PENDING);
			SetEvent(shutdownEvent);
			return;

		case SERVICE_CONTROL_PAUSE:
			/* Win32 config reloading */
			status.dwWaitHint = 5000;
			kill(postmasterPID, SIGHUP);
			return;

			/* FIXME: These could be used to replace other signals etc */
		case SERVICE_CONTROL_CONTINUE:
		case SERVICE_CONTROL_INTERROGATE:
		default:
			break;
	}
}

static void WINAPI
pgwin32_ServiceMain(DWORD argc, LPTSTR *argv)
{
	PROCESS_INFORMATION pi;
	DWORD		ret;
	DWORD		check_point_start;

	/* Initialize variables */
	status.dwWin32ExitCode = S_OK;
	status.dwCheckPoint = 0;
	status.dwWaitHint = 60000;
	status.dwServiceType = SERVICE_WIN32_OWN_PROCESS;
	status.dwControlsAccepted = SERVICE_ACCEPT_STOP | SERVICE_ACCEPT_SHUTDOWN | SERVICE_ACCEPT_PAUSE_CONTINUE;
	status.dwServiceSpecificExitCode = 0;
	status.dwCurrentState = SERVICE_START_PENDING;

	memset(&pi, 0, sizeof(pi));

	read_post_opts();

	/* Register the control request handler */
	if ((hStatus = RegisterServiceCtrlHandler(register_servicename, pgwin32_ServiceHandler)) == (SERVICE_STATUS_HANDLE) 0)
		return;

	if ((shutdownEvent = CreateEvent(NULL, true, false, NULL)) == NULL)
		return;

	/* Start the postmaster */
	pgwin32_SetServiceStatus(SERVICE_START_PENDING);
	if (!CreateRestrictedProcess(pgwin32_CommandLine(false), &pi, true))
	{
		pgwin32_SetServiceStatus(SERVICE_STOPPED);
		return;
	}
	postmasterPID = pi.dwProcessId;
	postmasterProcess = pi.hProcess;
	CloseHandle(pi.hThread);

	if (do_wait)
	{
		write_eventlog(EVENTLOG_INFORMATION_TYPE, _("Waiting for server startup...\n"));
		if (test_postmaster_connection(true) != PQPING_OK)
		{
			write_eventlog(EVENTLOG_INFORMATION_TYPE, _("Timed out waiting for server startup\n"));
			pgwin32_SetServiceStatus(SERVICE_STOPPED);
			return;
		}
		write_eventlog(EVENTLOG_INFORMATION_TYPE, _("Server started and accepting connections\n"));
	}

	/*
	 * Save the checkpoint value as it might have been incremented in
	 * test_postmaster_connection
	 */
	check_point_start = status.dwCheckPoint;

	pgwin32_SetServiceStatus(SERVICE_RUNNING);

	/* Wait for quit... */
	ret = WaitForMultipleObjects(2, shutdownHandles, FALSE, INFINITE);

	pgwin32_SetServiceStatus(SERVICE_STOP_PENDING);
	switch (ret)
	{
		case WAIT_OBJECT_0:		/* shutdown event */
			kill(postmasterPID, SIGINT);

			/*
			 * Increment the checkpoint and try again Abort after 12
			 * checkpoints as the postmaster has probably hung
			 */
			while (WaitForSingleObject(postmasterProcess, 5000) == WAIT_TIMEOUT && status.dwCheckPoint < 12)
				status.dwCheckPoint++;
			break;

		case (WAIT_OBJECT_0 + 1):		/* postmaster went down */
			break;

		default:
			/* shouldn't get here? */
			break;
	}

	CloseHandle(shutdownEvent);
	CloseHandle(postmasterProcess);

	pgwin32_SetServiceStatus(SERVICE_STOPPED);
}

static void
pgwin32_doRunAsService(void)
{
	SERVICE_TABLE_ENTRY st[] = {{register_servicename, pgwin32_ServiceMain},
	{NULL, NULL}};

	if (StartServiceCtrlDispatcher(st) == 0)
	{
		write_stderr(_("%s: could not start service \"%s\": error code %d\n"), progname, register_servicename, (int) GetLastError());
		exit(1);
	}
}


/*
 * Mingw headers are incomplete, and so are the libraries. So we have to load
 * a whole lot of API functions dynamically. Since we have to do this anyway,
 * also load the couple of functions that *do* exist in minwg headers but not
 * on NT4. That way, we don't break on NT4.
 */
typedef BOOL (WINAPI * __CreateRestrictedToken) (HANDLE, DWORD, DWORD, PSID_AND_ATTRIBUTES, DWORD, PLUID_AND_ATTRIBUTES, DWORD, PSID_AND_ATTRIBUTES, PHANDLE);
typedef BOOL (WINAPI * __IsProcessInJob) (HANDLE, HANDLE, PBOOL);
typedef HANDLE (WINAPI * __CreateJobObject) (LPSECURITY_ATTRIBUTES, LPCTSTR);
typedef BOOL (WINAPI * __SetInformationJobObject) (HANDLE, JOBOBJECTINFOCLASS, LPVOID, DWORD);
typedef BOOL (WINAPI * __AssignProcessToJobObject) (HANDLE, HANDLE);
typedef BOOL (WINAPI * __QueryInformationJobObject) (HANDLE, JOBOBJECTINFOCLASS, LPVOID, DWORD, LPDWORD);

/* Windows API define missing from some versions of MingW headers */
#ifndef  DISABLE_MAX_PRIVILEGE
#define DISABLE_MAX_PRIVILEGE	0x1
#endif

/*
 * Create a restricted token, a job object sandbox, and execute the specified
 * process with it.
 *
 * Returns 0 on success, non-zero on failure, same as CreateProcess().
 *
 * On NT4, or any other system not containing the required functions, will
 * launch the process under the current token without doing any modifications.
 *
 * NOTE! Job object will only work when running as a service, because it's
 * automatically destroyed when pg_ctl exits.
 */
static int
CreateRestrictedProcess(char *cmd, PROCESS_INFORMATION *processInfo, bool as_service)
{
	int			r;
	BOOL		b;
	STARTUPINFO si;
	HANDLE		origToken;
	HANDLE		restrictedToken;
	SID_IDENTIFIER_AUTHORITY NtAuthority = {SECURITY_NT_AUTHORITY};
	SID_AND_ATTRIBUTES dropSids[2];

	/* Functions loaded dynamically */
	__CreateRestrictedToken _CreateRestrictedToken = NULL;
	__IsProcessInJob _IsProcessInJob = NULL;
	__CreateJobObject _CreateJobObject = NULL;
	__SetInformationJobObject _SetInformationJobObject = NULL;
	__AssignProcessToJobObject _AssignProcessToJobObject = NULL;
	__QueryInformationJobObject _QueryInformationJobObject = NULL;
	HANDLE		Kernel32Handle;
	HANDLE		Advapi32Handle;

	ZeroMemory(&si, sizeof(si));
	si.cb = sizeof(si);

	Advapi32Handle = LoadLibrary("ADVAPI32.DLL");
	if (Advapi32Handle != NULL)
	{
		_CreateRestrictedToken = (__CreateRestrictedToken) GetProcAddress(Advapi32Handle, "CreateRestrictedToken");
	}

	if (_CreateRestrictedToken == NULL)
	{
		/*
		 * NT4 doesn't have CreateRestrictedToken, so just call ordinary
		 * CreateProcess
		 */
		write_stderr("WARNING: cannot create restricted tokens on this platform\n");
		if (Advapi32Handle != NULL)
			FreeLibrary(Advapi32Handle);
		return CreateProcess(NULL, cmd, NULL, NULL, FALSE, 0, NULL, NULL, &si, processInfo);
	}

	/* Open the current token to use as a base for the restricted one */
	if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ALL_ACCESS, &origToken))
	{
		write_stderr("Failed to open process token: %lu\n", GetLastError());
		return 0;
	}

	/* Allocate list of SIDs to remove */
	ZeroMemory(&dropSids, sizeof(dropSids));
	if (!AllocateAndInitializeSid(&NtAuthority, 2,
		 SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0,
								  0, &dropSids[0].Sid) ||
		!AllocateAndInitializeSid(&NtAuthority, 2,
	SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_POWER_USERS, 0, 0, 0, 0, 0,
								  0, &dropSids[1].Sid))
	{
		write_stderr("Failed to allocate SIDs: %lu\n", GetLastError());
		return 0;
	}

	b = _CreateRestrictedToken(origToken,
							   DISABLE_MAX_PRIVILEGE,
							   sizeof(dropSids) / sizeof(dropSids[0]),
							   dropSids,
							   0, NULL,
							   0, NULL,
							   &restrictedToken);

	FreeSid(dropSids[1].Sid);
	FreeSid(dropSids[0].Sid);
	CloseHandle(origToken);
	FreeLibrary(Advapi32Handle);

	if (!b)
	{
		write_stderr("Failed to create restricted token: %lu\n", GetLastError());
		return 0;
	}

#ifndef __CYGWIN__
	AddUserToTokenDacl(restrictedToken);
#endif

	r = CreateProcessAsUser(restrictedToken, NULL, cmd, NULL, NULL, TRUE, CREATE_SUSPENDED, NULL, NULL, &si, processInfo);

	Kernel32Handle = LoadLibrary("KERNEL32.DLL");
	if (Kernel32Handle != NULL)
	{
		_IsProcessInJob = (__IsProcessInJob) GetProcAddress(Kernel32Handle, "IsProcessInJob");
		_CreateJobObject = (__CreateJobObject) GetProcAddress(Kernel32Handle, "CreateJobObjectA");
		_SetInformationJobObject = (__SetInformationJobObject) GetProcAddress(Kernel32Handle, "SetInformationJobObject");
		_AssignProcessToJobObject = (__AssignProcessToJobObject) GetProcAddress(Kernel32Handle, "AssignProcessToJobObject");
		_QueryInformationJobObject = (__QueryInformationJobObject) GetProcAddress(Kernel32Handle, "QueryInformationJobObject");
	}

	/* Verify that we found all functions */
	if (_IsProcessInJob == NULL || _CreateJobObject == NULL || _SetInformationJobObject == NULL || _AssignProcessToJobObject == NULL || _QueryInformationJobObject == NULL)
	{
		/*
		 * IsProcessInJob() is not available on < WinXP, so there is no need
		 * to log the error every time in that case
		 */
		OSVERSIONINFO osv;

		osv.dwOSVersionInfoSize = sizeof(osv);
		if (!GetVersionEx(&osv) ||		/* could not get version */
			(osv.dwMajorVersion == 5 && osv.dwMinorVersion > 0) ||		/* 5.1=xp, 5.2=2003, etc */
			osv.dwMajorVersion > 5)		/* anything newer should have the API */

			/*
			 * Log error if we can't get version, or if we're on WinXP/2003 or
			 * newer
			 */
			write_stderr("WARNING: could not locate all job object functions in system API\n");
	}
	else
	{
		BOOL		inJob;

		if (_IsProcessInJob(processInfo->hProcess, NULL, &inJob))
		{
			if (!inJob)
			{
				/*
				 * Job objects are working, and the new process isn't in one,
				 * so we can create one safely. If any problems show up when
				 * setting it, we're going to ignore them.
				 */
				HANDLE		job;
				char		jobname[128];

				sprintf(jobname, "PostgreSQL_%lu", processInfo->dwProcessId);

				job = _CreateJobObject(NULL, jobname);
				if (job)
				{
					JOBOBJECT_BASIC_LIMIT_INFORMATION basicLimit;
					JOBOBJECT_BASIC_UI_RESTRICTIONS uiRestrictions;
					JOBOBJECT_SECURITY_LIMIT_INFORMATION securityLimit;
					OSVERSIONINFO osv;

					ZeroMemory(&basicLimit, sizeof(basicLimit));
					ZeroMemory(&uiRestrictions, sizeof(uiRestrictions));
					ZeroMemory(&securityLimit, sizeof(securityLimit));

					basicLimit.LimitFlags = JOB_OBJECT_LIMIT_DIE_ON_UNHANDLED_EXCEPTION | JOB_OBJECT_LIMIT_PRIORITY_CLASS;
					basicLimit.PriorityClass = NORMAL_PRIORITY_CLASS;
					_SetInformationJobObject(job, JobObjectBasicLimitInformation, &basicLimit, sizeof(basicLimit));

					uiRestrictions.UIRestrictionsClass = JOB_OBJECT_UILIMIT_DESKTOP | JOB_OBJECT_UILIMIT_DISPLAYSETTINGS |
						JOB_OBJECT_UILIMIT_EXITWINDOWS | JOB_OBJECT_UILIMIT_READCLIPBOARD |
						JOB_OBJECT_UILIMIT_SYSTEMPARAMETERS | JOB_OBJECT_UILIMIT_WRITECLIPBOARD;

					if (as_service)
					{
						osv.dwOSVersionInfoSize = sizeof(osv);
						if (!GetVersionEx(&osv) ||
							osv.dwMajorVersion < 6 ||
						(osv.dwMajorVersion == 6 && osv.dwMinorVersion == 0))
						{
							/*
							 * On Windows 7 (and presumably later),
							 * JOB_OBJECT_UILIMIT_HANDLES prevents us from
							 * starting as a service. So we only enable it on
							 * Vista and earlier (version <= 6.0)
							 */
							uiRestrictions.UIRestrictionsClass |= JOB_OBJECT_UILIMIT_HANDLES;
						}
					}
					_SetInformationJobObject(job, JobObjectBasicUIRestrictions, &uiRestrictions, sizeof(uiRestrictions));

					securityLimit.SecurityLimitFlags = JOB_OBJECT_SECURITY_NO_ADMIN | JOB_OBJECT_SECURITY_ONLY_TOKEN;
					securityLimit.JobToken = restrictedToken;
					_SetInformationJobObject(job, JobObjectSecurityLimitInformation, &securityLimit, sizeof(securityLimit));

					_AssignProcessToJobObject(job, processInfo->hProcess);
				}
			}
		}
	}


	CloseHandle(restrictedToken);

	ResumeThread(processInfo->hThread);

	FreeLibrary(Kernel32Handle);

	/*
	 * We intentionally don't close the job object handle, because we want the
	 * object to live on until pg_ctl shuts down.
	 */
	return r;
}
#endif

static void
do_advice(void)
{
	write_stderr(_("Try \"%s --help\" for more information.\n"), progname);
}



static void
do_help(void)
{
	printf(_("%s is a utility to start, stop, restart, promote, reload configuration files,\n"
			 "report the status of a PostgreSQL server, or signal a PostgreSQL process.\n\n"), progname);
	printf(_("Usage:\n"));
	printf(_("  %s init[db]               [-D DATADIR] [-s] [-o \"OPTIONS\"]\n"), progname);
	printf(_("  %s start   [-w] [-t SECS] [-D DATADIR] [-s] [-l FILENAME] [-o \"OPTIONS\"]\n"), progname);
	printf(_("  %s stop    [-W] [-t SECS] [-D DATADIR] [-s] [-m SHUTDOWN-MODE]\n"), progname);
	printf(_("  %s restart [-w] [-t SECS] [-D DATADIR] [-s] [-m SHUTDOWN-MODE]\n"
			 "                 [-o \"OPTIONS\"]\n"), progname);
	printf(_("  %s promote [-D DATADIR] [-s]\n"), progname);
	printf(_("  %s reload  [-D DATADIR] [-s]\n"), progname);
	printf(_("  %s status  [-D DATADIR]\n"), progname);
	printf(_("  %s kill    SIGNALNAME PID\n"), progname);
#if defined(WIN32) || defined(__CYGWIN__)
	printf(_("  %s register   [-N SERVICENAME] [-U USERNAME] [-P PASSWORD] [-D DATADIR]\n"
			 "                    [-S START-TYPE] [-w] [-t SECS] [-o \"OPTIONS\"]\n"), progname);
	printf(_("  %s unregister [-N SERVICENAME]\n"), progname);
#endif

	printf(_("\nCommon options:\n"));
	printf(_("  -D, --pgdata DATADIR   location of the database storage area\n"));
	printf(_("  -s, --silent           only print errors, no informational messages\n"));
	printf(_("  -t SECS                seconds to wait when using -w option\n"));
	printf(_("  -w                     wait until operation completes\n"));
	printf(_("  -W                     do not wait until operation completes\n"));
	printf(_("  --help                 show this help, then exit\n"));
	printf(_("  --version              output version information, then exit\n"));
	printf(_("(The default is to wait for shutdown, but not for start or restart.)\n\n"));
	printf(_("If the -D option is omitted, the environment variable PGDATA is used.\n"));

	printf(_("\nOptions for start or restart:\n"));
#if defined(HAVE_GETRLIMIT) && defined(RLIMIT_CORE)
	printf(_("  -c, --core-files       allow postgres to produce core files\n"));
#else
	printf(_("  -c, --core-files       not applicable on this platform\n"));
#endif
	printf(_("  -l, --log FILENAME     write (or append) server log to FILENAME\n"));
	printf(_("  -o OPTIONS             command line options to pass to postgres\n"
	 "                         (PostgreSQL server executable) or initdb\n"));
	printf(_("  -p PATH-TO-POSTGRES    normally not necessary\n"));
	printf(_("\nOptions for stop or restart:\n"));
	printf(_("  -m SHUTDOWN-MODE   can be \"smart\", \"fast\", or \"immediate\"\n"));

	printf(_("\nShutdown modes are:\n"));
	printf(_("  smart       quit after all clients have disconnected\n"));
	printf(_("  fast        quit directly, with proper shutdown\n"));
	printf(_("  immediate   quit without complete shutdown; will lead to recovery on restart\n"));

	printf(_("\nAllowed signal names for kill:\n"));
	printf("  HUP INT QUIT ABRT TERM USR1 USR2\n");

#if defined(WIN32) || defined(__CYGWIN__)
	printf(_("\nOptions for register and unregister:\n"));
	printf(_("  -N SERVICENAME  service name with which to register PostgreSQL server\n"));
	printf(_("  -P PASSWORD     password of account to register PostgreSQL server\n"));
	printf(_("  -U USERNAME     user name of account to register PostgreSQL server\n"));
	printf(_("  -S START-TYPE   service start type to register PostgreSQL server\n"));

	printf(_("\nStart types are:\n"));
	printf(_("  auto       start service automatically during system startup (default)\n"));
	printf(_("  demand     start service on demand\n"));
#endif

	printf(_("\nReport bugs to <pgsql-bugs@postgresql.org>.\n"));
}



static void
set_mode(char *modeopt)
{
	if (strcmp(modeopt, "s") == 0 || strcmp(modeopt, "smart") == 0)
	{
		shutdown_mode = SMART_MODE;
		sig = SIGTERM;
	}
	else if (strcmp(modeopt, "f") == 0 || strcmp(modeopt, "fast") == 0)
	{
		shutdown_mode = FAST_MODE;
		sig = SIGINT;
	}
	else if (strcmp(modeopt, "i") == 0 || strcmp(modeopt, "immediate") == 0)
	{
		shutdown_mode = IMMEDIATE_MODE;
		sig = SIGQUIT;
	}
	else
	{
		write_stderr(_("%s: unrecognized shutdown mode \"%s\"\n"), progname, modeopt);
		do_advice();
		exit(1);
	}
}



static void
set_sig(char *signame)
{
	if (!strcmp(signame, "HUP"))
		sig = SIGHUP;
	else if (!strcmp(signame, "INT"))
		sig = SIGINT;
	else if (!strcmp(signame, "QUIT"))
		sig = SIGQUIT;
	else if (!strcmp(signame, "ABRT"))
		sig = SIGABRT;

	/*
	 * probably should NOT provide SIGKILL
	 *
	 * else if (!strcmp(signame,"KILL")) sig = SIGKILL;
	 */
	else if (!strcmp(signame, "TERM"))
		sig = SIGTERM;
	else if (!strcmp(signame, "USR1"))
		sig = SIGUSR1;
	else if (!strcmp(signame, "USR2"))
		sig = SIGUSR2;
	else
	{
		write_stderr(_("%s: unrecognized signal name \"%s\"\n"), progname, signame);
		do_advice();
		exit(1);
	}
}


#if defined(WIN32) || defined(__CYGWIN__)
static void
set_starttype(char *starttypeopt)
{
	if (strcmp(starttypeopt, "a") == 0 || strcmp(starttypeopt, "auto") == 0)
		pgctl_start_type = SERVICE_AUTO_START;
	else if (strcmp(starttypeopt, "d") == 0 || strcmp(starttypeopt, "demand") == 0)
		pgctl_start_type = SERVICE_DEMAND_START;
	else
	{
		write_stderr(_("%s: unrecognized start type \"%s\"\n"), progname, starttypeopt);
		do_advice();
		exit(1);
	}
}
#endif


int
main(int argc, char **argv)
{
	static struct option long_options[] = {
		{"help", no_argument, NULL, '?'},
		{"version", no_argument, NULL, 'V'},
		{"log", required_argument, NULL, 'l'},
		{"mode", required_argument, NULL, 'm'},
		{"pgdata", required_argument, NULL, 'D'},
		{"silent", no_argument, NULL, 's'},
		{"timeout", required_argument, NULL, 't'},
		{"core-files", no_argument, NULL, 'c'},
		{NULL, 0, NULL, 0}
	};

	int			option_index;
	int			c;
	pgpid_t		killproc = 0;

#if defined(WIN32) || defined(__CYGWIN__)
	setvbuf(stderr, NULL, _IONBF, 0);
#endif

	progname = get_progname(argv[0]);
	set_pglocale_pgservice(argv[0], PG_TEXTDOMAIN("pg_ctl"));
	start_time = time(NULL);

	/*
	 * save argv[0] so do_start() can look for the postmaster if necessary. we
	 * don't look for postmaster here because in many cases we won't need it.
	 */
	argv0 = argv[0];

	umask(S_IRWXG | S_IRWXO);

	/* support --help and --version even if invoked as root */
	if (argc > 1)
	{
		if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0 ||
			strcmp(argv[1], "-?") == 0)
		{
			do_help();
			exit(0);
		}
		else if (strcmp(argv[1], "-V") == 0 || strcmp(argv[1], "--version") == 0)
		{
			puts("pg_ctl (PostgreSQL) " PG_VERSION);
			exit(0);
		}
	}

	/*
	 * Disallow running as root, to forestall any possible security holes.
	 */
#ifndef WIN32
	if (geteuid() == 0)
	{
		write_stderr(_("%s: cannot be run as root\n"
					   "Please log in (using, e.g., \"su\") as the "
					   "(unprivileged) user that will\n"
					   "own the server process.\n"),
					 progname);
		exit(1);
	}
#endif

	/*
	 * 'Action' can be before or after args so loop over both. Some
	 * getopt_long() implementations will reorder argv[] to place all flags
	 * first (GNU?), but we don't rely on it. Our /port version doesn't do
	 * that.
	 */
	optind = 1;

	/* process command-line options */
	while (optind < argc)
	{
		while ((c = getopt_long(argc, argv, "cD:l:m:N:o:p:P:sS:t:U:wW", long_options, &option_index)) != -1)
		{
			switch (c)
			{
				case 'D':
					{
						char	   *pgdata_D;
						char	   *env_var = pg_malloc(strlen(optarg) + 8);

						pgdata_D = xstrdup(optarg);
						canonicalize_path(pgdata_D);
						snprintf(env_var, strlen(optarg) + 8, "PGDATA=%s",
								 pgdata_D);
						putenv(env_var);

						/*
						 * We could pass PGDATA just in an environment
						 * variable but we do -D too for clearer postmaster
						 * 'ps' display
						 */
						pgdata_opt = pg_malloc(strlen(pgdata_D) + 7);
						snprintf(pgdata_opt, strlen(pgdata_D) + 7,
								 "-D \"%s\" ",
								 pgdata_D);
						break;
					}
				case 'l':
					log_file = xstrdup(optarg);
					break;
				case 'm':
					set_mode(optarg);
					break;
				case 'N':
					register_servicename = xstrdup(optarg);
					break;
				case 'o':
					post_opts = xstrdup(optarg);
					break;
				case 'p':
					exec_path = xstrdup(optarg);
					break;
				case 'P':
					register_password = xstrdup(optarg);
					break;
				case 's':
					silent_mode = true;
					break;
				case 'S':
#if defined(WIN32) || defined(__CYGWIN__)
					set_starttype(optarg);
#else
					write_stderr(_("%s: -S option not supported on this platform\n"),
								 progname);
					exit(1);
#endif
					break;
				case 't':
					wait_seconds = atoi(optarg);
					break;
				case 'U':
					if (strchr(optarg, '\\'))
						register_username = xstrdup(optarg);
					else
						/* Prepend .\ for local accounts */
					{
						register_username = malloc(strlen(optarg) + 3);
						if (!register_username)
						{
							write_stderr(_("%s: out of memory\n"), progname);
							exit(1);
						}
						strcpy(register_username, ".\\");
						strcat(register_username, optarg);
					}
					break;
				case 'w':
					do_wait = true;
					wait_set = true;
					break;
				case 'W':
					do_wait = false;
					wait_set = true;
					break;
				case 'c':
					allow_core_files = true;
					break;
				default:
					/* getopt_long already issued a suitable error message */
					do_advice();
					exit(1);
			}
		}

		/* Process an action */
		if (optind < argc)
		{
			if (ctl_command != NO_COMMAND)
			{
				write_stderr(_("%s: too many command-line arguments (first is \"%s\")\n"), progname, argv[optind]);
				do_advice();
				exit(1);
			}

			if (strcmp(argv[optind], "init") == 0
				|| strcmp(argv[optind], "initdb") == 0)
				ctl_command = INIT_COMMAND;
			else if (strcmp(argv[optind], "start") == 0)
				ctl_command = START_COMMAND;
			else if (strcmp(argv[optind], "stop") == 0)
				ctl_command = STOP_COMMAND;
			else if (strcmp(argv[optind], "restart") == 0)
				ctl_command = RESTART_COMMAND;
			else if (strcmp(argv[optind], "promote") == 0)
				ctl_command = PROMOTE_COMMAND;
			else if (strcmp(argv[optind], "reload") == 0)
				ctl_command = RELOAD_COMMAND;
			else if (strcmp(argv[optind], "status") == 0)
				ctl_command = STATUS_COMMAND;
			else if (strcmp(argv[optind], "kill") == 0)
			{
				if (argc - optind < 3)
				{
					write_stderr(_("%s: missing arguments for kill mode\n"), progname);
					do_advice();
					exit(1);
				}
				ctl_command = KILL_COMMAND;
				set_sig(argv[++optind]);
				killproc = atol(argv[++optind]);
			}
#if defined(WIN32) || defined(__CYGWIN__)
			else if (strcmp(argv[optind], "register") == 0)
				ctl_command = REGISTER_COMMAND;
			else if (strcmp(argv[optind], "unregister") == 0)
				ctl_command = UNREGISTER_COMMAND;
			else if (strcmp(argv[optind], "runservice") == 0)
				ctl_command = RUN_AS_SERVICE_COMMAND;
#endif
			else
			{
				write_stderr(_("%s: unrecognized operation mode \"%s\"\n"), progname, argv[optind]);
				do_advice();
				exit(1);
			}
			optind++;
		}
	}

	if (ctl_command == NO_COMMAND)
	{
		write_stderr(_("%s: no operation specified\n"), progname);
		do_advice();
		exit(1);
	}

	/* Note we put any -D switch into the env var above */
	pg_data = getenv("PGDATA");
	if (pg_data)
	{
		pg_data = xstrdup(pg_data);
		canonicalize_path(pg_data);
	}

	if (pg_data == NULL &&
		ctl_command != KILL_COMMAND && ctl_command != UNREGISTER_COMMAND)
	{
		write_stderr(_("%s: no database directory specified and environment variable PGDATA unset\n"),
					 progname);
		do_advice();
		exit(1);
	}

	if (!wait_set)
	{
		switch (ctl_command)
		{
			case RESTART_COMMAND:
			case START_COMMAND:
				do_wait = false;
				break;
			case STOP_COMMAND:
				do_wait = true;
				break;
			default:
				break;
		}
	}

	if (ctl_command == RELOAD_COMMAND)
	{
		sig = SIGHUP;
		do_wait = false;
	}

	if (pg_data)
	{
		snprintf(postopts_file, MAXPGPATH, "%s/postmaster.opts", pg_data);
		snprintf(pid_file, MAXPGPATH, "%s/postmaster.pid", pg_data);
		snprintf(backup_file, MAXPGPATH, "%s/backup_label", pg_data);
		snprintf(recovery_file, MAXPGPATH, "%s/recovery.conf", pg_data);
		snprintf(promote_file, MAXPGPATH, "%s/promote", pg_data);
	}

	switch (ctl_command)
	{
		case INIT_COMMAND:
			do_init();
			break;
		case STATUS_COMMAND:
			do_status();
			break;
		case START_COMMAND:
			do_start();
			break;
		case STOP_COMMAND:
			do_stop();
			break;
		case RESTART_COMMAND:
			do_restart();
			break;
		case PROMOTE_COMMAND:
			do_promote();
			break;
		case RELOAD_COMMAND:
			do_reload();
			break;
		case KILL_COMMAND:
			do_kill(killproc);
			break;
#if defined(WIN32) || defined(__CYGWIN__)
		case REGISTER_COMMAND:
			pgwin32_doRegister();
			break;
		case UNREGISTER_COMMAND:
			pgwin32_doUnregister();
			break;
		case RUN_AS_SERVICE_COMMAND:
			pgwin32_doRunAsService();
			break;
#endif
		default:
			break;
	}

	exit(0);
}
