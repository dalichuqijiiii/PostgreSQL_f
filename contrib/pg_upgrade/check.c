/*
 *	check.c
 *
 *	server checks and output routines
 *
 *	Copyright (c) 2010-2011, PostgreSQL Global Development Group
 *	contrib/pg_upgrade/check.c
 */

#include "pg_upgrade.h"


static void set_locale_and_encoding(ClusterInfo *cluster);
static void check_new_cluster_is_empty(void);
static void check_old_cluster_has_new_cluster_dbs(void);
static void check_locale_and_encoding(ControlData *oldctrl,
						  ControlData *newctrl);
static void check_for_isn_and_int8_passing_mismatch(ClusterInfo *cluster);
static void check_for_reg_data_type_usage(ClusterInfo *cluster);


void
output_check_banner(bool *live_check)
{
	if (user_opts.check && is_server_running(old_cluster.pgdata))
	{
		*live_check = true;
		if (old_cluster.port == new_cluster.port)
			pg_log(PG_FATAL, "When checking a live server, "
				   "the old and new port numbers must be different.\n");
		pg_log(PG_REPORT, "PerForming Consistency Checks on Old Live Server\n");
		pg_log(PG_REPORT, "------------------------------------------------\n");
	}
	else
	{
		pg_log(PG_REPORT, "Performing Consistency Checks\n");
		pg_log(PG_REPORT, "-----------------------------\n");
	}
}


void
check_old_cluster(bool live_check,
				  char **sequence_script_file_name)
{
	/* -- OLD -- */

	if (!live_check)
		start_postmaster(&old_cluster);

	set_locale_and_encoding(&old_cluster);

	get_pg_database_relfilenode(&old_cluster);

	/* Extract a list of databases and tables from the old cluster */
	get_db_and_rel_infos(&old_cluster);

	init_tablespaces();

	get_loadable_libraries();


	/*
	 * Check for various failure cases
	 */

	check_for_reg_data_type_usage(&old_cluster);
	check_for_isn_and_int8_passing_mismatch(&old_cluster);

	/* old = PG 8.3 checks? */
	if (GET_MAJOR_VERSION(old_cluster.major_version) <= 803)
	{
		old_8_3_check_for_name_data_type_usage(&old_cluster);
		old_8_3_check_for_tsquery_usage(&old_cluster);
		if (user_opts.check)
		{
			old_8_3_rebuild_tsvector_tables(&old_cluster, true);
			old_8_3_invalidate_hash_gin_indexes(&old_cluster, true);
			old_8_3_invalidate_bpchar_pattern_ops_indexes(&old_cluster, true);
		}
		else

			/*
			 * While we have the old server running, create the script to
			 * properly restore its sequence values but we report this at the
			 * end.
			 */
			*sequence_script_file_name =
				old_8_3_create_sequence_script(&old_cluster);
	}

	/* Pre-PG 9.0 had no large object permissions */
	if (GET_MAJOR_VERSION(old_cluster.major_version) <= 804)
		new_9_0_populate_pg_largeobject_metadata(&old_cluster, true);

	/*
	 * While not a check option, we do this now because this is the only time
	 * the old server is running.
	 */
	if (!user_opts.check)
	{
		generate_old_dump();
		split_old_dump();
	}

	if (!live_check)
		stop_postmaster(false);
}


void
check_new_cluster(void)
{
	set_locale_and_encoding(&new_cluster);

	get_db_and_rel_infos(&new_cluster);

	check_new_cluster_is_empty();
	check_old_cluster_has_new_cluster_dbs();

	check_loadable_libraries();

	check_locale_and_encoding(&old_cluster.controldata, &new_cluster.controldata);

	if (user_opts.transfer_mode == TRANSFER_MODE_LINK)
		check_hard_link();
}


void
report_clusters_compatible(void)
{
	if (user_opts.check)
	{
		pg_log(PG_REPORT, "\n*Clusters are compatible*\n");
		/* stops new cluster */
		stop_postmaster(false);
		exit(0);
	}

	pg_log(PG_REPORT, "\n"
		   "| If pg_upgrade fails after this point, you must\n"
		   "| re-initdb the new cluster before continuing.\n"
		   "| You will also need to remove the \".old\" suffix\n"
		   "| from %s/global/pg_control.old.\n", old_cluster.pgdata);
}


void
issue_warnings(char *sequence_script_file_name)
{
	/* old = PG 8.3 warnings? */
	if (GET_MAJOR_VERSION(old_cluster.major_version) <= 803)
	{
		start_postmaster(&new_cluster);

		/* restore proper sequence values using file created from old server */
		if (sequence_script_file_name)
		{
			prep_status("Adjusting sequences");
			exec_prog(true,
					  SYSTEMQUOTE "\"%s/psql\" --set ON_ERROR_STOP=on "
					  "--no-psqlrc --port %d --username \"%s\" "
					  "-f \"%s\" --dbname template1 >> \"%s\"" SYSTEMQUOTE,
					  new_cluster.bindir, new_cluster.port, os_info.user,
					  sequence_script_file_name, log_opts.filename);
			unlink(sequence_script_file_name);
			check_ok();
		}

		old_8_3_rebuild_tsvector_tables(&new_cluster, false);
		old_8_3_invalidate_hash_gin_indexes(&new_cluster, false);
		old_8_3_invalidate_bpchar_pattern_ops_indexes(&new_cluster, false);
		stop_postmaster(false);
	}

	/* Create dummy large object permissions for old < PG 9.0? */
	if (GET_MAJOR_VERSION(old_cluster.major_version) <= 804)
	{
		start_postmaster(&new_cluster);
		new_9_0_populate_pg_largeobject_metadata(&new_cluster, false);
		stop_postmaster(false);
	}
}


void
output_completion_banner(char *deletion_script_file_name)
{
	/* Did we copy the free space files? */
	if (GET_MAJOR_VERSION(old_cluster.major_version) >= 804)
		pg_log(PG_REPORT,
			   "| Optimizer statistics are not transferred by pg_upgrade\n"
			   "| so consider running:\n"
			   "| \tvacuumdb --all --analyze-only\n"
			   "| on the newly-upgraded cluster.\n\n");
	else
		pg_log(PG_REPORT,
			   "| Optimizer statistics and free space information\n"
			   "| are not transferred by pg_upgrade so consider\n"
			   "| running:\n"
			   "| \tvacuumdb --all --analyze\n"
			   "| on the newly-upgraded cluster.\n\n");

	pg_log(PG_REPORT,
		   "| Running this script will delete the old cluster's data files:\n"
		   "| \t%s\n",
		   deletion_script_file_name);
}


void
check_cluster_versions(void)
{
	/* get old and new cluster versions */
	old_cluster.major_version = get_major_server_version(&old_cluster);
	new_cluster.major_version = get_major_server_version(&new_cluster);

	/*
	 * We allow upgrades from/to the same major version for alpha/beta
	 * upgrades
	 */

	if (GET_MAJOR_VERSION(old_cluster.major_version) < 803)
		pg_log(PG_FATAL, "This utility can only upgrade from PostgreSQL version 8.3 and later.\n");

	/* Only current PG version is supported as a target */
	if (GET_MAJOR_VERSION(new_cluster.major_version) != GET_MAJOR_VERSION(PG_VERSION_NUM))
		pg_log(PG_FATAL, "This utility can only upgrade to PostgreSQL version %s.\n",
			   PG_MAJORVERSION);

	/*
	 * We can't allow downgrading because we use the target pg_dumpall, and
	 * pg_dumpall cannot operate on new datbase versions, only older versions.
	 */
	if (old_cluster.major_version > new_cluster.major_version)
		pg_log(PG_FATAL, "This utility cannot be used to downgrade to older major PostgreSQL versions.\n");
}


void
check_cluster_compatibility(bool live_check)
{
	char		libfile[MAXPGPATH];
	FILE	   *lib_test;

	/*
	 * Test pg_upgrade_support.so is in the proper place.	 We cannot copy it
	 * ourselves because install directories are typically root-owned.
	 */
	snprintf(libfile, sizeof(libfile), "%s/pg_upgrade_support%s", new_cluster.libpath,
			 DLSUFFIX);

	if ((lib_test = fopen(libfile, "r")) == NULL)
		pg_log(PG_FATAL,
			   "\npg_upgrade_support%s must be created and installed in %s\n", DLSUFFIX, libfile);
	else
		fclose(lib_test);

	/* get/check pg_control data of servers */
	get_control_data(&old_cluster, live_check);
	get_control_data(&new_cluster, false);
	check_control_data(&old_cluster.controldata, &new_cluster.controldata);

	/* Is it 9.0 but without tablespace directories? */
	if (GET_MAJOR_VERSION(new_cluster.major_version) == 900 &&
		new_cluster.controldata.cat_ver < TABLE_SPACE_SUBDIRS_CAT_VER)
		pg_log(PG_FATAL, "This utility can only upgrade to PostgreSQL version 9.0 after 2010-01-11\n"
			   "because of backend API changes made during development.\n");
}


/*
 * set_locale_and_encoding()
 *
 * query the database to get the template0 locale
 */
static void
set_locale_and_encoding(ClusterInfo *cluster)
{
	ControlData *ctrl = &cluster->controldata;
	PGconn	   *conn;
	PGresult   *res;
	int			i_encoding;
	int			cluster_version = cluster->major_version;

	conn = connectToServer(cluster, "template1");

	/* for pg < 80400, we got the values from pg_controldata */
	if (cluster_version >= 80400)
	{
		int			i_datcollate;
		int			i_datctype;

		res = executeQueryOrDie(conn,
								"SELECT datcollate, datctype "
								"FROM 	pg_catalog.pg_database "
								"WHERE	datname = 'template0' ");
		assert(PQntuples(res) == 1);

		i_datcollate = PQfnumber(res, "datcollate");
		i_datctype = PQfnumber(res, "datctype");

		ctrl->lc_collate = pg_strdup(PQgetvalue(res, 0, i_datcollate));
		ctrl->lc_ctype = pg_strdup(PQgetvalue(res, 0, i_datctype));

		PQclear(res);
	}

	res = executeQueryOrDie(conn,
							"SELECT pg_catalog.pg_encoding_to_char(encoding) "
							"FROM 	pg_catalog.pg_database "
							"WHERE	datname = 'template0' ");
	assert(PQntuples(res) == 1);

	i_encoding = PQfnumber(res, "pg_encoding_to_char");
	ctrl->encoding = pg_strdup(PQgetvalue(res, 0, i_encoding));

	PQclear(res);

	PQfinish(conn);
}


/*
 * check_locale_and_encoding()
 *
 *	locale is not in pg_controldata in 8.4 and later so
 *	we probably had to get via a database query.
 */
static void
check_locale_and_encoding(ControlData *oldctrl,
						  ControlData *newctrl)
{
	if (strcmp(oldctrl->lc_collate, newctrl->lc_collate) != 0)
		pg_log(PG_FATAL,
			   "old and new cluster lc_collate values do not match\n");
	if (strcmp(oldctrl->lc_ctype, newctrl->lc_ctype) != 0)
		pg_log(PG_FATAL,
			   "old and new cluster lc_ctype values do not match\n");
	if (strcmp(oldctrl->encoding, newctrl->encoding) != 0)
		pg_log(PG_FATAL,
			   "old and new cluster encoding values do not match\n");
}


static void
check_new_cluster_is_empty(void)
{
	int			dbnum;

	for (dbnum = 0; dbnum < new_cluster.dbarr.ndbs; dbnum++)
	{
		int			relnum;
		RelInfoArr *rel_arr = &new_cluster.dbarr.dbs[dbnum].rel_arr;

		for (relnum = 0; relnum < rel_arr->nrels;
			 relnum++)
		{
			/* pg_largeobject and its index should be skipped */
			if (strcmp(rel_arr->rels[relnum].nspname, "pg_catalog") != 0)
				pg_log(PG_FATAL, "New cluster database \"%s\" is not empty\n",
					new_cluster.dbarr.dbs[dbnum].db_name);
		}
	}

}


/*
 *	If someone removes the 'postgres' database from the old cluster and
 *	the new cluster has a 'postgres' database, the number of databases
 *	will not match.  We actually could upgrade such a setup, but it would
 *	violate the 1-to-1 mapping of database counts, so we throw an error
 *	instead.  We would detect this as a database count mismatch during
 *	upgrade, but we want to detect it during the check phase and report
 *	the database name.
 */
static void
check_old_cluster_has_new_cluster_dbs(void)
{
	int			old_dbnum, new_dbnum;

	for (new_dbnum = 0; new_dbnum < new_cluster.dbarr.ndbs; new_dbnum++)
	{
		for (old_dbnum = 0; old_dbnum < old_cluster.dbarr.ndbs; old_dbnum++)
			if (strcmp(old_cluster.dbarr.dbs[old_dbnum].db_name,
				new_cluster.dbarr.dbs[new_dbnum].db_name) == 0)
				break;
		if (old_dbnum == old_cluster.dbarr.ndbs)
			pg_log(PG_FATAL, "New cluster database \"%s\" does not exist in the old cluster\n",
				new_cluster.dbarr.dbs[new_dbnum].db_name);
	}
}


/*
 * create_script_for_old_cluster_deletion()
 *
 *	This is particularly useful for tablespace deletion.
 */
void
create_script_for_old_cluster_deletion(
									   char **deletion_script_file_name)
{
	FILE	   *script = NULL;
	int			tblnum;

	*deletion_script_file_name = pg_malloc(MAXPGPATH);

	prep_status("Creating script to delete old cluster");

	snprintf(*deletion_script_file_name, MAXPGPATH, "%s/delete_old_cluster.%s",
			 os_info.cwd, SCRIPT_EXT);

	if ((script = fopen(*deletion_script_file_name, "w")) == NULL)
		pg_log(PG_FATAL, "Could not create necessary file:  %s\n",
			   *deletion_script_file_name);

#ifndef WIN32
	/* add shebang header */
	fprintf(script, "#!/bin/sh\n\n");
#endif

	/* delete old cluster's default tablespace */
	fprintf(script, RMDIR_CMD " %s\n", old_cluster.pgdata);

	/* delete old cluster's alternate tablespaces */
	for (tblnum = 0; tblnum < os_info.num_tablespaces; tblnum++)
	{
		/*
		 * Do the old cluster's per-database directories share a directory
		 * with a new version-specific tablespace?
		 */
		if (strlen(old_cluster.tablespace_suffix) == 0)
		{
			/* delete per-database directories */
			int			dbnum;

			fprintf(script, "\n");
			/* remove PG_VERSION? */
			if (GET_MAJOR_VERSION(old_cluster.major_version) <= 804)
				fprintf(script, RM_CMD " %s%s/PG_VERSION\n",
				 os_info.tablespaces[tblnum], old_cluster.tablespace_suffix);

			for (dbnum = 0; dbnum < new_cluster.dbarr.ndbs; dbnum++)
			{
				fprintf(script, RMDIR_CMD " %s%s/%d\n",
				  os_info.tablespaces[tblnum], old_cluster.tablespace_suffix,
						old_cluster.dbarr.dbs[dbnum].db_oid);
			}
		}
		else

			/*
			 * Simply delete the tablespace directory, which might be ".old"
			 * or a version-specific subdirectory.
			 */
			fprintf(script, RMDIR_CMD " %s%s\n",
				 os_info.tablespaces[tblnum], old_cluster.tablespace_suffix);
	}

	fclose(script);

#ifndef WIN32
	if (chmod(*deletion_script_file_name, S_IRWXU) != 0)
		pg_log(PG_FATAL, "Could not add execute permission to file:  %s\n",
			   *deletion_script_file_name);
#endif

	check_ok();
}


/*
 *	check_for_isn_and_int8_passing_mismatch()
 *
 *	/contrib/isn relies on data type int8, and in 8.4 int8 can now be passed
 *	by value.  The schema dumps the CREATE TYPE PASSEDBYVALUE setting so
 *	it must match for the old and new servers.
 */
static void
check_for_isn_and_int8_passing_mismatch(ClusterInfo *cluster)
{
	int			dbnum;
	FILE	   *script = NULL;
	bool		found = false;
	char		output_path[MAXPGPATH];

	prep_status("Checking for /contrib/isn with bigint-passing mismatch");

	if (old_cluster.controldata.float8_pass_by_value ==
		new_cluster.controldata.float8_pass_by_value)
	{
		/* no mismatch */
		check_ok();
		return;
	}

	snprintf(output_path, sizeof(output_path), "%s/contrib_isn_and_int8_pass_by_value.txt",
			 os_info.cwd);

	for (dbnum = 0; dbnum < cluster->dbarr.ndbs; dbnum++)
	{
		PGresult   *res;
		bool		db_used = false;
		int			ntups;
		int			rowno;
		int			i_nspname,
					i_proname;
		DbInfo	   *active_db = &cluster->dbarr.dbs[dbnum];
		PGconn	   *conn = connectToServer(cluster, active_db->db_name);

		/* Find any functions coming from contrib/isn */
		res = executeQueryOrDie(conn,
								"SELECT n.nspname, p.proname "
								"FROM	pg_catalog.pg_proc p, "
								"		pg_catalog.pg_namespace n "
								"WHERE	p.pronamespace = n.oid AND "
								"		p.probin = '$libdir/isn'");

		ntups = PQntuples(res);
		i_nspname = PQfnumber(res, "nspname");
		i_proname = PQfnumber(res, "proname");
		for (rowno = 0; rowno < ntups; rowno++)
		{
			found = true;
			if (script == NULL && (script = fopen(output_path, "w")) == NULL)
				pg_log(PG_FATAL, "Could not create necessary file:  %s\n", output_path);
			if (!db_used)
			{
				fprintf(script, "Database:  %s\n", active_db->db_name);
				db_used = true;
			}
			fprintf(script, "  %s.%s\n",
					PQgetvalue(res, rowno, i_nspname),
					PQgetvalue(res, rowno, i_proname));
		}

		PQclear(res);

		PQfinish(conn);
	}

	if (script)
		fclose(script);

	if (found)
	{
		pg_log(PG_REPORT, "fatal\n");
		pg_log(PG_FATAL,
			   "| Your installation contains \"/contrib/isn\" functions\n"
			   "| which rely on the bigint data type.  Your old and\n"
			   "| new clusters pass bigint values differently so this\n"
			   "| cluster cannot currently be upgraded.  You can\n"
			   "| manually upgrade data that use \"/contrib/isn\"\n"
			   "| facilities and remove \"/contrib/isn\" from the\n"
			   "| old cluster and restart the upgrade.  A list\n"
			   "| of the problem functions is in the file:\n"
			   "| \t%s\n\n", output_path);
	}
	else
		check_ok();
}


/*
 * check_for_reg_data_type_usage()
 *	pg_upgrade only preserves these system values:
 *		pg_class.relfilenode
 *		pg_type.oid
 *		pg_enum.oid
 *
 *	Most of the reg* data types reference system catalog info that is
 *	not preserved, and hence these data types cannot be used in user
 *	tables upgraded by pg_upgrade.
 */
static void
check_for_reg_data_type_usage(ClusterInfo *cluster)
{
	int			dbnum;
	FILE	   *script = NULL;
	bool		found = false;
	char		output_path[MAXPGPATH];

	prep_status("Checking for reg* system oid user data types");

	snprintf(output_path, sizeof(output_path), "%s/tables_using_reg.txt",
			 os_info.cwd);

	for (dbnum = 0; dbnum < cluster->dbarr.ndbs; dbnum++)
	{
		PGresult   *res;
		bool		db_used = false;
		int			ntups;
		int			rowno;
		int			i_nspname,
					i_relname,
					i_attname;
		DbInfo	   *active_db = &cluster->dbarr.dbs[dbnum];
		PGconn	   *conn = connectToServer(cluster, active_db->db_name);

		res = executeQueryOrDie(conn,
								"SELECT n.nspname, c.relname, a.attname "
								"FROM	pg_catalog.pg_class c, "
								"		pg_catalog.pg_namespace n, "
								"		pg_catalog.pg_attribute a "
								"WHERE	c.oid = a.attrelid AND "
								"		NOT a.attisdropped AND "
								"		a.atttypid IN ( "
		  "			'pg_catalog.regproc'::pg_catalog.regtype, "
								"			'pg_catalog.regprocedure'::pg_catalog.regtype, "
		  "			'pg_catalog.regoper'::pg_catalog.regtype, "
								"			'pg_catalog.regoperator'::pg_catalog.regtype, "
		 "			'pg_catalog.regclass'::pg_catalog.regtype, "
		/* regtype.oid is preserved, so 'regtype' is OK */
		"			'pg_catalog.regconfig'::pg_catalog.regtype, "
								"			'pg_catalog.regdictionary'::pg_catalog.regtype) AND "
								"		c.relnamespace = n.oid AND "
							  "		n.nspname != 'pg_catalog' AND "
						 "		n.nspname != 'information_schema'");

		ntups = PQntuples(res);
		i_nspname = PQfnumber(res, "nspname");
		i_relname = PQfnumber(res, "relname");
		i_attname = PQfnumber(res, "attname");
		for (rowno = 0; rowno < ntups; rowno++)
		{
			found = true;
			if (script == NULL && (script = fopen(output_path, "w")) == NULL)
				pg_log(PG_FATAL, "Could not create necessary file:  %s\n", output_path);
			if (!db_used)
			{
				fprintf(script, "Database:  %s\n", active_db->db_name);
				db_used = true;
			}
			fprintf(script, "  %s.%s.%s\n",
					PQgetvalue(res, rowno, i_nspname),
					PQgetvalue(res, rowno, i_relname),
					PQgetvalue(res, rowno, i_attname));
		}

		PQclear(res);

		PQfinish(conn);
	}

	if (script)
		fclose(script);

	if (found)
	{
		pg_log(PG_REPORT, "fatal\n");
		pg_log(PG_FATAL,
			   "| Your installation contains one of the reg* data types in\n"
			   "| user tables.  These data types reference system oids that\n"
			   "| are not preserved by pg_upgrade, so this cluster cannot\n"
			   "| currently be upgraded.  You can remove the problem tables\n"
			   "| and restart the upgrade.  A list of the problem columns\n"
			   "| is in the file:\n"
			   "| \t%s\n\n", output_path);
	}
	else
		check_ok();
}
