Þ    l      |     Ü      0	      1	     R	  &   d	     	     «	  -   Ê	     ø	     
  |   +
     ¨
  a   È
  K   *     v  A     !   Ó  3   õ  ?   )  ?   i  H   ©  D   ò  E   7  ?   }  >   ½  9   ü  B   6  <   y  z   ¶  0   1  F   b  >   ©  8   è  2   !  O   T  7   ¤     Ü     ã     ì  !   }  C     y   ã  C   ]  D   ¡  >   æ  A   %  *   g  /     %   Â  /   è  #        <  3   Z  0     ,   ¿  .   ì  3     -   O  0   }  5   ®  "   ä  $     J   ,     w       3   ª  0   Þ          "  !   A  $   c        -   ©  4   ×  %     $   2  "   W  F   z  F   Á       7     )   T  q   ~  f   ð  %   W  &   }     ¤  d   ¬       &   0  0   W  .     )   ·  )   á  "         .  (   O     x  !        µ     Í     á     ÷               )     9  "   Q     t  j    1   þ     0  -   O  )   }  *   §  J   Ò  9         W   |   t      ñ   a   !  K   s!     ¿!  A   Ú!  !   "  A   >"  M   "  G   Î"  S   #  \   j#  Y   Ç#  A   !$  ^   c$  S   Â$  Z   %  I   q%     »%  /   R&  q   &  T   ô&  D   I'  B   '     Ñ'  H   b(     «(     ³(  Ö   Ç(  *   )  r   É)  ¬   <*  i   é*  i   S+  r   ½+  l   0,  J   ,  ;   è,  C   $-  P   h-  D   ¹-  ?   þ-  J   >.  O   .  B   Ù.  I   /  ]   f/  R   Ä/  J   0  P   b0  ?   ³0  0   ó0  S   $1  2   x1  )   «1  N   Õ1  O   $2     t2  )   2  *   ¹2  ,   ä2  3   3  ?   E3  A   3  '   Ç3  6   ï3  '   &4  t   N4  K   Ã4  &   5  X   65  :   5  ¯   Ê5  ¯   z6  :   *7  3   e7     7     ¨7  1   H8  8   z8  A   ³8  1   õ8  5   '9  5   ]9  :   9  +   Î9  @   ú9  1   ;:  C   m:  +   ±:     Ý:     ý:  .   ;     I;     `;     ;  .    ;  6   Ï;  0   <               5      6         Y                      (      9   .   #          e           '   R   [   W   K   <   ]   f      B   D   &       P   H          -   %              j   
   7       T   :                   G   A       4      C           \   *   c   Z   J                 d       `   	   F   @       !   "       ,   =      3       k               U   h      V                   S   L       1   $      ?   2       /      ^   O          N   l   8   +   >           b   i                 _             Q   M   g   E   X           a   0       )   I   ;           
Allowed signal names for kill:
 
Common options:
 
Options for register and unregister:
 
Options for start or restart:
 
Options for stop or restart:
 
Report bugs to <pgsql-bugs@postgresql.org>.
 
Shutdown modes are:
   %s kill    SIGNALNAME PID
   %s register   [-N SERVICENAME] [-U USERNAME] [-P PASSWORD] [-D DATADIR]
                    [-w] [-t SECS] [-o "OPTIONS"]
   %s reload  [-D DATADIR] [-s]
   %s restart [-w] [-t SECS] [-D DATADIR] [-s] [-m SHUTDOWN-MODE]
                 [-o "OPTIONS"]
   %s start   [-w] [-t SECS] [-D DATADIR] [-s] [-l FILENAME] [-o "OPTIONS"]
   %s status  [-D DATADIR]
   %s stop    [-W] [-t SECS] [-D DATADIR] [-s] [-m SHUTDOWN-MODE]
   %s unregister [-N SERVICENAME]
   --help                 show this help, then exit
   --version              output version information, then exit
   -D, --pgdata DATADIR   location of the database storage area
   -N SERVICENAME  service name with which to register PostgreSQL server
   -P PASSWORD     password of account to register PostgreSQL server
   -U USERNAME     user name of account to register PostgreSQL server
   -W                     do not wait until operation completes
   -c, --core-files       allow postgres to produce core files
   -c, --core-files       not applicable on this platform
   -l, --log FILENAME     write (or append) server log to FILENAME
   -m SHUTDOWN-MODE   can be "smart", "fast", or "immediate"
   -o OPTIONS             command line options to pass to postgres
                         (PostgreSQL server executable)
   -p PATH-TO-POSTGRES    normally not necessary
   -s, --silent           only print errors, no informational messages
   -t SECS                seconds to wait when using -w option
   -w                     wait until operation completes
   fast        quit directly, with proper shutdown
   immediate   quit without complete shutdown; will lead to recovery on restart
   smart       quit after all clients have disconnected
  done
  failed
 %s is a utility to start, stop, restart, reload configuration files,
report the status of a PostgreSQL server, or signal a PostgreSQL process.

 %s: PID file "%s" does not exist
 %s: another server might be running; trying to start server anyway
 %s: cannot be run as root
Please log in (using, e.g., "su") as the (unprivileged) user that will
own the server process.
 %s: cannot reload server; single-user server is running (PID: %ld)
 %s: cannot restart server; single-user server is running (PID: %ld)
 %s: cannot set core file size limit; disallowed by hard limit
 %s: cannot stop server; single-user server is running (PID: %ld)
 %s: could not find own program executable
 %s: could not find postgres program executable
 %s: could not open PID file "%s": %s
 %s: could not open service "%s": error code %d
 %s: could not open service manager
 %s: could not read file "%s"
 %s: could not register service "%s": error code %d
 %s: could not send reload signal (PID: %ld): %s
 %s: could not send signal %d (PID: %ld): %s
 %s: could not send stop signal (PID: %ld): %s
 %s: could not start server
Examine the log output.
 %s: could not start server: exit code was %d
 %s: could not start service "%s": error code %d
 %s: could not unregister service "%s": error code %d
 %s: invalid data in PID file "%s"
 %s: missing arguments for kill mode
 %s: no database directory specified and environment variable PGDATA unset
 %s: no operation specified
 %s: no server running
 %s: old server process (PID: %ld) seems to be gone
 %s: option file "%s" must have exactly one line
 %s: out of memory
 %s: server does not shut down
 %s: server is running (PID: %ld)
 %s: service "%s" already registered
 %s: service "%s" not registered
 %s: single-user server is running (PID: %ld)
 %s: too many command-line arguments (first is "%s")
 %s: unrecognized operation mode "%s"
 %s: unrecognized shutdown mode "%s"
 %s: unrecognized signal name "%s"
 (The default is to wait for shutdown, but not for start or restart.)

 If the -D option is omitted, the environment variable PGDATA is used.
 Is server running?
 Please terminate the single-user server and try again.
 Server started and accepting connections
 The program "postgres" is needed by %s but was not found in the
same directory as "%s".
Check your installation.
 The program "postgres" was found by "%s"
but was not the same version as %s.
Check your installation.
 Timed out waiting for server startup
 Try "%s --help" for more information.
 Usage:
 WARNING: online backup mode is active
Shutdown will not complete until pg_stop_backup() is called.

 Waiting for server startup...
 child process exited with exit code %d child process exited with unrecognized status %d child process was terminated by exception 0x%X child process was terminated by signal %d child process was terminated by signal %s could not change directory to "%s" could not find a "%s" to execute could not identify current directory: %s could not read binary "%s" could not read symbolic link "%s" could not start server
 invalid binary "%s" server shutting down
 server signaled
 server started
 server starting
 server stopped
 starting server anyway
 waiting for server to shut down... waiting for server to start... Project-Id-Version: PostgreSQL 8.4
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2009-04-07 22:01+0900
PO-Revision-Date: 2009-04-12 14:17+0900
Last-Translator: HOTTA Michihide <hotta@net-newbie.com>
Language-Team: jpug-doc <jpug-doc@ml.postgresql.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
killã¢ã¼ãã§å©ç¨ã§ããã·ã°ãã«å:
 
ä¸è¬çãªãªãã·ã§ã³:
 
ç»é²ãç»é²è§£é¤ç¨ã®ãªãã·ã§ã³:
 
èµ·åãåèµ·åç¨ã®ãªãã·ã§ã³
 
åæ­¢ãåèµ·åç¨ã®ãªãã·ã§ã³:
 
ä¸å·åã¯<pgsql-bugs@postgresql.org>ã¾ã§å ±åãã¦ãã ããã
 
ã·ã£ãããã¦ã³ã¢ã¼ãã¯ä»¥ä¸ã®éãã§ã:
   %s kill    SIGNALNAME PID
   %s register   [-N SERVICENAME] [-U USERNAME] [-P PASSWORD] [-D DATADIR]
                    [-w] [-t SECS] [-o "OPTIONS"]
   %s reload  [-D DATADIR] [-s]
   %s restart [-w] [-t SECS] [-D DATADIR] [-s] [-m SHUTDOWN-MODE]
                 [-o "OPTIONS"]
   %s start   [-w] [-t SECS] [-D DATADIR] [-s] [-l FILENAME] [-o "OPTIONS"]
   %s status  [-D DATADIR]
   %s stop    [-W] [-t SECS] [-D DATADIR] [-s] [-m SHUTDOWN-MODE]
   %s unregister [-N SERVICENAME]
   --help                 ãã«ããè¡¨ç¤ºããçµäºãã¾ã
   --version              ãã¼ã¸ã§ã³æå ±ãè¡¨ç¤ºããçµäºãã¾ã
   -D, --pgdata DATADIR   ãã¼ã¿ãã¼ã¹æ ¼ç´é åã®å ´æã§ã
   -N SERVICENAME  PostgreSQLãµã¼ããç»é²ããããã®ãµã¼ãã¹åã§ã
   -P PASSWORD     PostgreSQLãµã¼ããç»é²ããã¢ã«ã¦ã³ãã®ãã¹ã¯ã¼ãã§ã
   -U USERNAME     PostgreSQLãµã¼ããç»é²ããã¢ã«ã¦ã³ãã®ã¦ã¼ã¶åã§ã
   -W                     ä½æ¥­ã®å®äºã¾ã§å¾æ©ãã¾ãã
   -c, --core-files       postgresã¯ã³ã¢ãã¡ã¤ã«ãçæãããã¨ãã§ãã¾ãã
   -c, --core-files       ãã®ãã©ãããã©ã¼ã ã§ã¯å®è¡ã§ãã¾ãã
   -l, --log FILENAME     ãµã¼ãã­ã°ãFILENAMEã¸åºå(ãããã¯è¿½å )ãã¾ã
   -m SHUTDOWN-MODE   "smart"ã"fast"ã"immediate"ã®ããããã§ã
   -o OPTIONS             postgres(PostgreSQLãµã¼ãå®è¡ãã¡ã¤ã«)ã«æ¸¡ã
                         ã³ãã³ãã©ã¤ã³ãªãã·ã§ã³ã§ã
   -p PATH-TO-POSTGRES    éå¸¸ã¯ä¸è¦ã§ã
   -s, --silent           ã¨ã©ã¼ã¡ãã»ã¼ã¸ã®ã¿ãè¡¨ç¤ºããæå ±ã¡ãã»ã¼ã¸ã¯è¡¨ç¤ºãã¾ãã
   -t SECS               -wãªãã·ã§ã³ãä½¿ç¨ããæã®å¾æ©ç§æ°ã§ãã
   -w                     ä½æ¥­ãå®äºããã¾ã§å¾æ©ãã¾ã
   fast        ã·ã£ãããã¦ã³æç¶ãå¾ã«åæ­¢ãã¾ã
   immediate   ã·ã£ãããã¦ã³æç¶ããè¡ããã«åæ­¢ãã¾ããåèµ·åæã«ãªã«ããªç¶æã«ãªãå¯è½æ§ãããã¾ã
   smart       å¨ã¯ã©ã¤ã¢ã³ãã®æ¥ç¶åæ­å¾ã«åæ­¢ãã¾ã
 å®äº
 å¤±æãã¾ãã
 %sã¯PostgreSQLãµã¼ãã®èµ·åãåæ­¢ãåèµ·åãè¨­å®ãã¡ã¤ã«ã®ãªã­ã¼ããç¶æ³å ±å
ãè¡ãã¦ã¼ãã£ãªãã£ã§ããã¾ããPostgreSQLãã­ã»ã¹ã¸ã·ã°ãã«ãéä¿¡ãã¾ãã

 %s: PIDãã¡ã¤ã«"%s"ãããã¾ãã
 %s: ä»ã®ãµã¼ããåä½ä¸­ã®å¯è½æ§ãããã¾ãããã¨ã«ããpostmasterã®èµ·åãè©¦ã¿ã¾ãã
 %s: rootã§ã¯å®è¡ã§ãã¾ãã
ãµã¼ããã­ã»ã¹ã®ææèã¨ãªã(éç¹æ¨©)ã¦ã¼ã¶ã¨ãã¦(ä¾ãã°"su"ãä½¿ç¨ãã¦)
ã­ã°ã¤ã³ãã¦ãã ããã
 %s: ãµã¼ãããªã­ã¼ãã§ãã¾ãããã·ã³ã°ã«ã¦ã¼ã¶ãµã¼ã(PID: %ld)ãåä½ä¸­ã§ã
 %s: ãµã¼ããåèµ·åã§ãã¾ãããã·ã³ã°ã«ã¦ã¼ã¶ãµã¼ã(PID: %ld)ãåä½ä¸­ã§ãã
 %s: ã³ã¢ãã¡ã¤ã«ã®ãµã¤ãºå¶éãè¨­å®ã§ãã¾ãã:åºå®ã®å¶éã«ããè¨±ããã¦ãã¾ãã
 %s: ãµã¼ããåæ­¢ã§ãã¾ãããã·ã³ã°ã«ã¦ã¼ã¶ãµã¼ã(PID: %ld)ãåä½ãã¦ãã¾ãã
 %s: æ¬ãã­ã°ã©ã ã®å®è¡ãã¡ã¤ã«ã®æ¤ç´¢ã«å¤±æãã¾ãã
 %s: postgres ã®å®è¡ãã¡ã¤ã«ãè¦ã¤ããã¾ãã
 %s: PIDãã¡ã¤ã«"%s"ããªã¼ãã³ã§ãã¾ããã§ãã: %s
 %s: ãµã¼ãã¹"%s"ã®ãªã¼ãã³ã«å¤±æãã¾ãã: ã¨ã©ã¼ã³ã¼ã %d
 %s: ãµã¼ãã¹ããã¼ã¸ã£ã®ãªã¼ãã³ã«å¤±æãã¾ãã
 %s: ãã¡ã¤ã«"%s"ãèª­ã¿åããã¨ã«å¤±æãã¾ãã
 %s: ãµã¼ãã¹"%s"ã®ç»é²ã«å¤±æãã¾ãã: ã¨ã©ã¼ã³ã¼ã %d
 %s: ãªã­ã¼ãã·ã°ãã«ãéä¿¡ã§ãã¾ããã§ããã(PID: %ld): %s
 %s: ã·ã°ãã«%dãéä¿¡ã§ãã¾ããã§ãã(PID: %ld): %s
 %s: åæ­¢ã·ã°ãã«ãéä¿¡ã§ãã¾ããã§ããã(PID: %ld): %s
 %s: ãµã¼ããèµ·åã§ãã¾ããã§ããã
ã­ã°åºåãç¢ºèªãã¦ãã ããã
 %s: ãµã¼ããèµ·åã§ãã¾ããã§ãããçµäºã³ã¼ãã¯%dã§ããã
 %s: ãµã¼ãã¹"%s"ã®èµ·åã«å¤±æãã¾ãã: ã¨ã©ã¼ã³ã¼ã %d
 %s: ãµã¼ãã¹"%s"ã®ç»é²åé¤ã«å¤±æãã¾ãã: ã¨ã©ã¼ã³ã¼ã %d
 %s: PIDãã¡ã¤ã«"%s"åã«ç¡å¹ãªãã¼ã¿ãããã¾ã
 %s: killã¢ã¼ãç¨ã®å¼æ°ãããã¾ãã
 %s: ãã¼ã¿ãã¼ã¹ã®æå®ããPGDATAç°å¢å¤æ°ã®è¨­å®ãããã¾ãã
 %s: æä½ã¢ã¼ããæå®ããã¦ãã¾ãã
 %s: ãµã¼ããåä½ãã¦ãã¾ãã
 %s: å¤ããµã¼ããã­ã»ã¹(PID: %ld)ãåä½ãã¦ããªãããã§ã
 %s: ãªãã·ã§ã³ãã¡ã¤ã«"%s"ã¯1è¡ã®ã¿ã§ãªããã°ãªãã¾ãã
 %s: ã¡ã¢ãªä¸è¶³ã§ã
 %s: ãµã¼ãã¯åæ­¢ãã¦ãã¾ãã
 %s: ãµã¼ããåä½ä¸­ã§ã(PID: %ld)
 %s: ãµã¼ãã¹\"%s\"ã¯ç»é²æ¸ã¿ã§ã
 %s: ãµã¼ãã¹"%s"ã¯ç»é²ããã¦ãã¾ãã
 %s: ã·ã³ã°ã«ã¦ã¼ã¶ãµã¼ããåä½ä¸­ã§ã(PID: %ld)
 %s: ã³ãã³ãã©ã¤ã³å¼æ°ãå¤ããã¾ã(åé ­ã¯"%s")
 %s: æä½ã¢ã¼ã"%s"ã¯ä¸æã§ã
 %s: ã·ã£ãããã¦ã³ã¢ã¼ã"%s"ã¯ä¸æã§ã
 %s: ã·ã°ãã«å"%s"ã¯ä¸æã§ã
 (ããã©ã«ãã§ã¯ãã·ã£ãããã¦ã³æã¯å¾æ©ããèµ·åã¨åèµ·åã®æã¯å¾æ©ã
ã¾ããã)

 -Dãªãã·ã§ã³ã®çç¥æãPGDATAç°å¢å¤æ°ãä½¿ç¨ããã¾ãã
 ãµã¼ããåä½ãã¦ãã¾ãã?
 ã·ã³ã°ã«ã¦ã¼ã¶ãµã¼ããçµäºããã¦ãããååº¦å®è¡ãã¦ãã ãã
 ãµã¼ãã¯èµ·åããæ¥ç¶ãåãä»ãã¦ãã¾ã
 %sã§ã¯"postgres"ãã­ã°ã©ã ãå¿è¦ã§ããã"%s"ã¨åããã£ã¬ã¯ããªã«ãã
ã¾ããã§ããã
ã¤ã³ã¹ãã¬ã¼ã·ã§ã³ãæ¤æ»ãã¦ãã ããã
 "postgres"ãã­ã°ã©ã ã¯"%s"ã«ããã¾ãããã%sã¨åããã¼ã¸ã§ã³ã§
ã¯ããã¾ããã§ããã
ã¤ã³ã¹ãã¬ã¼ã·ã§ã³ãæ¤æ»ãã¦ãã ããã
 ãµã¼ãã®èµ·åå¾æ©ãã¿ã¤ã ã¢ã¦ããã¾ãã
 è©³ç´°ã¯"%s --help"ãå®è¡ãã¦ãã ããã
 ä½¿ç¨æ¹æ³:
 è­¦å: ãªã³ã©ã¤ã³ããã¯ã¢ããã¢ã¼ããå®è¡ä¸­ã§ãã
pg_stop_backup()ãå¼ã³åºãããã¾ã§ã·ã£ãããã¦ã³ã¯å®äºãã¾ãã

 ãµã¼ãã®èµ·åå®äºãå¾ã£ã¦ãã¾ã...
 å­ãã­ã»ã¹ãçµäºã³ã¼ã%dã§çµäºãã¾ãã å­ãã­ã»ã¹ãæªç¥ã®ã¹ãã¼ã¿ã¹%dã§çµäºãã¾ãã å­ãã­ã»ã¹ãä¾å¤0x%Xã§çµäºãã¾ãã å­ãã­ã»ã¹ãã·ã°ãã«%dã§çµäºãã¾ãã å­ãã­ã»ã¹ãã·ã°ãã«%sã§çµäºãã¾ãã ãã£ã¬ã¯ããªã"%s"ã«å¤æ´ã§ãã¾ããã§ãã å®è¡ãã"%s"ãããã¾ããã§ãã ç¾å¨ã®ãã£ã¬ã¯ããªãèªè­ã§ãã¾ããã§ãã: %s ãã¤ããª"%s"ãèª­ã¿åãã¾ããã§ãã ã·ã³ããªãã¯ãªã³ã¯"%s"ã®èª­ã¿åãã«å¤±æãã¾ãã ãµã¼ããèµ·åã§ãã¾ããã§ãã
 ãã¤ããª"%s"ã¯ç¡å¹ã§ã ãµã¼ãã®åæ­¢ä¸­ã§ã
 ãµã¼ãã«ã·ã°ãã«ãéä¿¡ãã¾ãã
 ãµã¼ãèµ·åå®äº
 ãµã¼ãã¯èµ·åä¸­ã§ãã
 ãµã¼ãã¯åæ­¢ãã¾ãã
 ã¨ã«ãããµã¼ããèµ·åãã¦ãã¾ã
 ãµã¼ãåæ­¢å¦çã®å®äºãå¾ã£ã¦ãã¾ã... ãµã¼ãã®èµ·åå®äºãå¾ã£ã¦ãã¾ã... 