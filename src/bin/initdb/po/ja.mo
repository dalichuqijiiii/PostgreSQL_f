Þ          <  ³   \      (  R   )     |  
        ¥  -   ¶     ä      n      A     5   X  J        Ù  6   õ  P   ,  C   }  :   Á  ]   ü  4   Z  B     H   Ò  G     >   c  9   ¢  3   Ü  ?     /   P  -     E   ®  y   ô  (   n  #     7   »  (   ó  ,     3   I  '   }  3   ¥  D   Ù  (     8   G  -     -   ®  /   Ü  "     6   /  +   f       0   ©  ;   Ú  $     /   ;     k  $     ~   ®  1   -     _  /   }  J   ­  Ç   ø     À  C   Ó  -     8   E  !   ~  ,      /   Í  4   ý  A   2  @   t  ,   µ  P   â  I   3  b   }     à     ñ       [        ð     	     '  ;   ?  9   {     µ  >   F  ;       Á  u   Ò   q   H!  f   º!  s   !"  &   "     ¼"     Ä"  &   Ó"  0   ú"  .   +#  )   Z#  )   #  "   ®#  #   Ñ#  "   õ#      $  (   9$  "   b$     $  "    $  !   Ã$  ,   å$  $   %  *   7%  %   b%  !   %     ª%     Ä%     ß%      ú%     &     8&  -   S&  0   &     ²&     Ñ&     í&  )   '     +'     /'  &   >'  %   e'     '  +   ¡'  !   Í'  j  ï'  e   Z)  '   À)     è)     û)  J   *  Ç   e*  à   -+  s  ,  c   -  7   æ-  s   .     .  J   ®.  _   ù.  b   Y/  J   ¼/  m   0  S   u0  P   É0  h   1  \   1  P   à1  J   12  ;   |2  J   ¸2  F   3  :   J3  n   3  ³   ô3  F   ¨4  @   ï4  I   05  C   z5  I   ¾5  D   6  7   M6  L   6  T   Ò6  H   '7  W   p7  Q   È7  Q   8  a   l8  <   Î8  Q   9  K   ]9  &   ©9  G   Ð9  \   :  >   u:  S   ´:  '   ;  7   0;  µ   h;  M   <  +   l<  Q   <  k   ê<  B  V=     >  b   ´>  E   ?  Z   ]?  E   ¸?  Q   þ?  d   P@  D   µ@  f   ú@  q   aA  '   ÓA  l   ûA  O   hB     ¸B     OC  L   lC  Ó   ¹C     D  (   E  A   ;E  1   }E  j   ¯E  K   F  ¬   fF  T   G  K   hG  s  ´G  ¬   (I  ¯   ÕI  ¯   J  ©   5K  0   ßK     L  "   L  8   BL  A   {L  1   ½L  5   ïL  5   %M  7   [M  8   M  :   ÌM  +   N  @   3N  E   tN  1   ºN  ?   ìN  F   ,O  ]   sO  6   ÑO  f   P  A   oP  /   ±P  #   áP  /   Q  1   5Q  /   gQ  5   Q  2   ÍQ  D    R  :   ER  ,   R  )   ­R     ×R  G   ÷R     ?S     CS  >   ZS  ?   S  ,   ÙS  D   T  A   KT            X       m   C   U   e              q   Q   "       ^   ;   k       E   @   {   *       i          _           v          |   d      >   A   u      ?   +   o      t      h       J      c   [   Y   n   ]   1   a   P   W       b   D       j      !                         N           #   B   H      2   %   3   <          R   S   )   =   l   .             :              6         	   M              /          g      O              f               '       K   p            -   `   5   $   F   8              9   y   L   w   \       &       0       s             z   r       Z          
   G         V       I       ~              (   4       T          ,   }   x   7        
If the data directory is not specified, the environment variable PGDATA
is used.
 
Less commonly used options:
 
Options:
 
Other options:
 
Report bugs to <pgsql-bugs@postgresql.org>.
 
Success. You can now start the database server using:

    %s%s%spostgres%s -D %s%s%s
or
    %s%s%spg_ctl%s -D %s%s%s -l logfile start

 
WARNING: enabling "trust" authentication for local connections
You can change this by editing pg_hba.conf or using the -A option the
next time you run initdb.
       --lc-collate=, --lc-ctype=, --lc-messages=LOCALE
      --lc-monetary=, --lc-numeric=, --lc-time=LOCALE
                            set default locale in the respective category for
                            new databases (default taken from environment)
       --locale=LOCALE       set default locale for new databases
       --no-locale           equivalent to --locale=C
       --pwfile=FILE         read password for the new superuser from file
   %s [OPTION]... [DATADIR]
   -?, --help                show this help, then exit
   -A, --auth=METHOD         default authentication method for local connections
   -E, --encoding=ENCODING   set default encoding for new databases
   -L DIRECTORY              where to find the input files
   -T, --text-search-config=CFG
                            default text search configuration
   -U, --username=NAME       database superuser name
   -V, --version             output version information, then exit
   -W, --pwprompt            prompt for a password for the new superuser
   -X, --xlogdir=XLOGDIR     location for the transaction log directory
   -d, --debug               generate lots of debugging output
   -n, --noclean             do not clean up after errors
   -s, --show                show internal settings
  [-D, --pgdata=]DATADIR     location for this database cluster
 %s initializes a PostgreSQL database cluster.

 %s: "%s" is not a valid server encoding name
 %s: The password file was not generated. Please report this problem.
 %s: cannot be run as root
Please log in (using, e.g., "su") as the (unprivileged) user that will
own the server process.
 %s: could not access directory "%s": %s
 %s: could not access file "%s": %s
 %s: could not change permissions of directory "%s": %s
 %s: could not create directory "%s": %s
 %s: could not create symbolic link "%s": %s
 %s: could not determine valid short version string
 %s: could not execute command "%s": %s
 %s: could not find suitable encoding for locale %s
 %s: could not find suitable text search configuration for locale %s
 %s: could not get current user name: %s
 %s: could not obtain information about current user: %s
 %s: could not open file "%s" for reading: %s
 %s: could not open file "%s" for writing: %s
 %s: could not read password from file "%s": %s
 %s: could not write file "%s": %s
 %s: data directory "%s" not removed at user's request
 %s: directory "%s" exists but is not empty
 %s: encoding mismatch
 %s: failed to remove contents of data directory
 %s: failed to remove contents of transaction log directory
 %s: failed to remove data directory
 %s: failed to remove transaction log directory
 %s: file "%s" does not exist
 %s: file "%s" is not a regular file
 %s: input file "%s" does not belong to PostgreSQL %s
Check your installation or specify the correct path using the option -L.
 %s: input file location must be an absolute path
 %s: invalid locale name "%s"
 %s: locale %s requires unsupported encoding %s
 %s: must specify a password for the superuser to enable %s authentication
 %s: no data directory specified
You must identify the directory where the data for this database system
will reside.  Do this with either the invocation option -D or the
environment variable PGDATA.
 %s: out of memory
 %s: password prompt and password file cannot be specified together
 %s: removing contents of data directory "%s"
 %s: removing contents of transaction log directory "%s"
 %s: removing data directory "%s"
 %s: removing transaction log directory "%s"
 %s: symlinks are not supported on this platform %s: too many command-line arguments (first is "%s")
 %s: transaction log directory "%s" not removed at user's request
 %s: transaction log directory location must be an absolute path
 %s: unrecognized authentication method "%s"
 %s: warning: specified text search configuration "%s" might not match locale %s
 %s: warning: suitable text search configuration for locale %s is unknown
 Encoding %s is not allowed as a server-side encoding.
Rerun %s with a different locale selection.
 Enter it again:  Enter new superuser password:  If you want to create a new database system, either remove or empty
the directory "%s" or run %s
with an argument other than "%s".
 If you want to store the transaction log there, either
remove or empty the directory "%s".
 Passwords didn't match.
 Rerun %s with the -E option.
 Running in debug mode.
 Running in noclean mode.  Mistakes will not be cleaned up.
 The database cluster will be initialized with locale %s.
 The database cluster will be initialized with locales
  COLLATE:  %s
  CTYPE:    %s
  MESSAGES: %s
  MONETARY: %s
  NUMERIC:  %s
  TIME:     %s
 The default database encoding has accordingly been set to %s.
 The default text search configuration will be set to "%s".
 The encoding you selected (%s) and the encoding that the
selected locale uses (%s) do not match.  This would lead to
misbehavior in various character string processing functions.
Rerun %s and either do not specify an encoding explicitly,
or choose a matching combination.
 The files belonging to this database system will be owned by user "%s".
This user must also own the server process.

 The program "postgres" is needed by %s but was not found in the
same directory as "%s".
Check your installation.
 The program "postgres" was found by "%s"
but was not the same version as %s.
Check your installation.
 This might mean you have a corrupted installation or identified
the wrong directory with the invocation option -L.
 Try "%s --help" for more information.
 Usage:
 caught signal
 child process exited with exit code %d child process exited with unrecognized status %d child process was terminated by exception 0x%X child process was terminated by signal %d child process was terminated by signal %s copying template1 to postgres ...  copying template1 to template0 ...  could not change directory to "%s" could not find a "%s" to execute could not identify current directory: %s could not open directory "%s": %s
 could not read binary "%s" could not read directory "%s": %s
 could not read symbolic link "%s" could not remove file or directory "%s": %s
 could not set junction for "%s": %s
 could not stat file or directory "%s": %s
 could not write to child process: %s
 creating configuration files ...  creating conversions ...  creating dictionaries ...  creating directory %s ...  creating information schema ...  creating subdirectories ...  creating system views ...  creating template1 database in %s/base/1 ...  fixing permissions on existing directory %s ...  initializing dependencies ...  initializing pg_authid ...  invalid binary "%s" loading system objects' descriptions ...  ok
 out of memory
 selecting default max_connections ...  selecting default shared_buffers ...  setting password ...  setting privileges on built-in objects ...  vacuuming database template1 ...  Project-Id-Version: PostgreSQL 8.4
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2009-04-11 22:46+0900
PO-Revision-Date: 2009-08-25 23:04+0900
Last-Translator: HOTTA Michihide <hotta@net-newbie.com>
Language-Team: jpug-doc <jpug-doc@ml.postgresql.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
ãã¼ã¿ãã£ã¬ã¯ããªãæå®ãããªãå ´åãPGDATAç°å¢å¤æ°ãä½¿ç¨ããã¾ãã
 
ä½¿ç¨é »åº¦ã®ä½ããªãã·ã§ã³:
 
ãªãã·ã§ã³:
 
ãã®ä»ã®ãªãã·ã§ã³:
 
ä¸å·åã¯<pgsql-bugs@postgresql.org>ã¾ã§å ±åãã¦ãã ããã
 
æåãã¾ãããä»¥ä¸ãä½¿ç¨ãã¦ãã¼ã¿ãã¼ã¹ãµã¼ããèµ·åãããã¨ãã§ãã¾ãã

    %s%s%spostgres%s -D %s%s%s
ã¾ãã¯
    %s%s%spg_ctl%s -D %s%s%s -l logfile start

 
è­¦å: ã­ã¼ã«ã«æ¥ç¶åãã«"trust"èªè¨¼ãæå¹ã§ãã
pg_hba.confãç·¨éããããããã¯ãæ¬¡åinitdbãå®è¡ããæã«-Aãªãã·ã§
ã³ãä½¿ç¨ãããã¨ã§å¤æ´ãããã¨ãã§ãã¾ãã
       --lc-collate, --lc-ctype, --lc-messages=ã­ã±ã¼ã«å
      --lc-monetary, --lc-numeric, --lc-time=ã­ã±ã¼ã«å
                            æ°ãããã¼ã¿ãã¼ã¹ã«å¯¾å¿ããã«ãã´ãªã«å¯¾ãã
                            ããã©ã«ãã­ã±ã¼ã«ãã»ãã(ããã©ã«ãå¤ã¯
                            ç°å¢å¤æ°ããé¸ã°ãã¾ã)
       --locale=LOCALE        æ°ãããã¼ã¿ãã¼ã¹ã®ããã©ã«ãã­ã±ã¼ã«ãã»ãã
       --no-locale           --locale=C ã¨åãã§ã
       --pwfile=ãã¡ã¤ã«å   æ°ããã¹ã¼ãã¼ã¦ã¼ã¶ã®ãã¹ã¯ã¼ãããã¡ã¤ã«ããèª­ã¿è¾¼ã
   %s [OPTION]... [DATADIR]
   -?, --help                ãã®ãã«ããè¡¨ç¤ºããçµäºãã¾ã
   -A, --auth=METHOD         ã­ã¼ã«ã«ãªæ¥ç¶åãã®ããã©ã«ãã®èªè¨¼æ¹å¼ã§ã
   -E, --encoding=ENCODING   æ°è¦ãã¼ã¿ãã¼ã¹ç¨ã®ããã©ã«ãã®ç¬¦å·åæ¹å¼ã§ã
   -L DIRECTORY              å¥åãã¡ã¤ã«ã®å ´æãæå®ãã¾ã
   -T, --text-search-config=CFG\
                            ããã©ã«ãã®ãã­ã¹ãæ¤ç´¢è¨­å®ã§ã
   -U, --username=NAME       ãã¼ã¿ãã¼ã¹ã¹ã¼ãã¼ã¦ã¼ã¶ã®ååã§ã
   -V, --version             ãã¼ã¸ã§ã³æå ±ãè¡¨ç¤ºããçµäºãã¾ã
   -W, --pwprompt            æ°è¦ã¹ã¼ãã¼ã¦ã¼ã¶ã«å¯¾ãã¦ãã¹ã¯ã¼ãå¥åãä¿ãã¾ã
   -X, --xlogdir=XLOGDIR     ãã©ã³ã¶ã¯ã·ã§ã³ã­ã°ãã£ã¬ã¯ããªã®å ´æã§ã
   -d, --debug               å¤ãã®ãããã°ç¨ã®åºåãçæãã¾ã
   -n, --noclean             ã¨ã©ã¼çºçå¾ã®åé¤ãè¡ãã¾ãã
   -s, --show                åé¨è¨­å®ãè¡¨ç¤ºãã¾ã
  [-D, --pgdata=]DATADIR     ãã¼ã¿ãã¼ã¹ã¯ã©ã¹ã¿ã®å ´æã§ã
 %sã¯PostgreSQLãã¼ã¿ãã¼ã¹ã¯ã©ã¹ã¿ãåæåãã¾ãã
 %s: "%s" ã¯ç¡å¹ãªãµã¼ãç¬¦å·åæ¹å¼åã§ãã
 %s: ãã¹ã¯ã¼ããã¡ã¤ã«ãçæã§ãã¾ããã§ããããã®åé¡ãå ±åãã¦ãã ããã
 %s: ã«ã¼ãã§ã¯å®è¡ã§ãã¾ããã
ãµã¼ããã­ã»ã¹ã®ææèã¨ãªã(éç¹æ¨©)ã¦ã¼ã¶ã¨ãã¦(ä¾ãã°"su"ãä½¿ç¨ãã¦)ã­ã°ã¤ã³ãã¦ãã ããã
 %s: ãã£ã¬ã¯ããª"%s"ã«ã¢ã¯ã»ã¹ã§ãã¾ããã§ãã: %s
 %s: ãã¡ã¤ã«"%s"ã«ã¢ã¯ã»ã¹ã§ãã¾ããã§ãã: %s
 %s: ãã£ã¬ã¯ããª"%s"ã®æ¨©éãå¤æ´ã§ãã¾ããã§ãã: %s
 %s: ãã£ã¬ã¯ããª"%s"ãä½æã§ãã¾ããã§ããã: %s
 %s: ã·ã³ããªãã¯ãªã³ã¯"%s"ãä½æã§ãã¾ããã§ãã: %s
 %s: æå¹ãªçç¥çã®æå­åãæ±ºå®ã§ãã¾ããã§ãã
 %s: ã³ãã³ã"%s"ã®å®å¹ã«å¤±æãã¾ãã: %s
 %s: ã­ã±ã¼ã«%sç¨ã«é©åãªç¬¦å·åæ¹å¼ãããã¾ããã§ãã
 %s: ã­ã±ã¼ã«"%s"ç¨ã®é©åãªãã­ã¹ãæ¤ç´¢è¨­å®ãè¦ã¤ããã¾ãã
 %s: ç¾å¨ã®ã¦ã¼ã¶åãå¾ããã¨ãã§ãã¾ããã§ãã: %s
 %s: ç¾å¨ã®ã¦ã¼ã¶ã«é¢ããæå ±ãå¾ããã¨ãã§ãã¾ããã§ãã: %s
 %s: èª­ã¿åãç¨ã®ãã¡ã¤ã«"%s"ããªã¼ãã³ã§ãã¾ããã§ãã:%s
 %s:æ¸ãè¾¼ã¿ç¨ã®ãã¡ã¤ã«"%s"ããªã¼ãã³ã§ãã¾ããã§ãã: %s
 %s: ãã¡ã¤ã«"%s"ãããã¹ã¯ã¼ããèª­ã¿åããã¨ãã§ãã¾ããã§ããã: %s
 %s:ãã¡ã¤ã«"%s"ã®æ¸ãè¾¼ã¿ã«å¤±æãã¾ãã: %s
 %s: ã¦ã¼ã¶ãè¦æ±ãããã¼ã¿ãã£ã¬ã¯ããª"%s"ãåé¤ãã¾ãã
 %s: ãã£ã¬ã¯ããª"%s"ã¯å­å¨ãã¾ãããç©ºã§ã¯ããã¾ãã
 %s: ç¬¦å·åæ¹å¼ãåãã¾ãã
 %s: ãã¼ã¿ãã£ã¬ã¯ããªã®åå®¹ã®åé¤ã«å¤±æãã¾ãã
 %s: ãã©ã³ã¶ã¯ã·ã§ã³ã­ã°ãã£ã¬ã¯ããªã®åå®¹ã®åé¤ã«å¤±æãã¾ãã
 %s: ãã¼ã¿ãã£ã¬ã¯ããªã®åé¤ã«å¤±æãã¾ãã
 %s: ãã©ã³ã¶ã¯ã·ã§ã³ã­ã°ãã£ã¬ã¯ããªã®åé¤ã«å¤±æãã¾ãã
 %s: ãã¡ã¤ã«"%s"ãããã¾ãã
 %s: "%s" ã¯éå¸¸ã®ãã¡ã¤ã«ã§ã¯ããã¾ãã
 %s: å¥åãã¡ã¤ã«"%s"ãPostgreSQL %sã«ããã¾ãã
ã¤ã³ã¹ãã¬ã¼ã·ã§ã³ãæ¤æ»ãã-Lãªãã·ã§ã³ãä½¿ç¨ãã¦æ­£ãããã¹ãæå®ãã¦ãã ããã
 %s: å¥åãã¡ã¤ã«ã®å ´æã¯çµ¶å¯¾ãã¹ã§ãªããã°ãªãã¾ãã
 "%s: ã­ã±ã¼ã«å"%s"ã¯ç¡å¹ã§ãã
 %s: ã­ã±ã¼ã«%sã¯ãµãã¼ãããªãç¬¦å·åæ¹å¼%sãå¿è¦ã¨ãã¾ã
 "%s: %sèªè¨¼ãæå¹ã«ããããã«ã¹ã¼ãã¼ã¦ã¼ã¶ã®ãã¹ã¯ã¼ããæå®ãã¦ãã ãã
 %s: ãã¼ã¿ãã£ã¬ã¯ããªãæå®ããã¦ãã¾ãã
ãã¼ã¿ãã¼ã¹ã·ã¹ãã ç¨ã®ãã¼ã¿ãæ ¼ç´ãããã£ã¬ã¯ããªãæå®ããªããã°ãªã
ã¾ããã-Dãªãã·ã§ã³ãä»ãã¦å¼ã³åºãããããã¯ãPGDATAç°å¢å¤æ°ãä½¿ç¨ãã
ãã¨ã§æå®ãããã¨ãã§ãã¾ãã
 %s: ã¡ã¢ãªä¸è¶³ã§ã
 %s: ãã¹ã¯ã¼ããã­ã³ããã¨ãã¹ã¯ã¼ããã¡ã¤ã«ã¯åæã«æå®ã§ãã¾ãã
 %s: ãã¼ã¿ãã£ã¬ã¯ããª"%s"ã®åå®¹ãåé¤ãã¦ãã¾ã
 %s: ãã©ã³ã¶ã¯ã·ã§ã³ã­ã°ãã£ã¬ã¯ããª"%s"ã®åå®¹ãåé¤ãã¦ãã¾ã
 %s: ãã¼ã¿ãã£ã¬ã¯ããª"%s"ã®åé¤ãåé¤ãã¦ãã¾ã
 %s: ãã©ã³ã¶ã¯ã·ã§ã³ã­ã°ãã£ã¬ã¯ããª"%s"ãåé¤ãã¦ãã¾ã
 %s: ãã®ãã©ãããã©ã¼ã ã§ã·ã³ããªãã¯ãªã³ã¯ã¯ãµãã¼ãããã¦ãã¾ãã %s: ã³ãã³ãã©ã¤ã³å¼æ°ãå¤ããã¾ãã(å§ãã¯"%s")
 %s: ã¦ã¼ã¶ãè¦æ±ãããã©ã³ã¶ã¯ã·ã§ã³ã­ã°ãã£ã¬ã¯ããª"%s"ãåé¤ãã¾ãã
 %s: ãã©ã³ã¶ã¯ã·ã§ã³ã­ã°ã®ãã£ã¬ã¯ããªã®ä½ç½®ã¯ãçµ¶å¯¾ãã¹ã§ãªããã°ãªãã¾ãã
 %s: "%s"ã¯æªç¥ã®èªè¨¼æ¹å¼ã§ã
 %s:è­¦å:æå®ãããã­ã¹ãæ¤ç´¢è¨­å®"%s"ãã­ã±ã¼ã«%sã«åããªãå¯è½æ§
ãããã¾ã
 %s:è­¦å:ã­ã±ã¼ã«%sã«é©ãããã­ã¹ãæ¤ç´¢è¨­å®ãä¸æã§ãã
 ç¬¦å·åæ¹å¼%sã¯ãµã¼ãå´ã®ç¬¦å·åæ¹å¼ã¨ãã¦ä½¿ç¨ã§ãã¾ããã
å¥ã®ã­ã±ã¼ã«ãé¸æãã¦%sãåå®è¡ãã¦ãã ãã
 åå¥åãã¦ãã ãã: æ°ããã¹ã¼ãã¼ã¦ã¼ã¶ã®ãã¹ã¯ã¼ããå¥åãã¦ãã ãã: æ°è¦ã«ãã¼ã¿ãã¼ã¹ã·ã¹ãã ãä½æãããã®ã§ããã°ããã£ã¬ã¯ããª"%s"
ãåé¤ãããç©ºã«ãã¦ãã ãããã¾ãã¯ã%sã"%s"ä»¥å¤ã®å¼æ°ã§å®è¡ãã¦
ãã ããã
 ããã«ãã©ã³ã¶ã¯ã·ã§ã³ã­ã°ãæ ¼ç´ãããå ´åã¯ãã£ã¬ã¯ããª"%s"ãåé¤ããã
ç©ºã«ãã¦ãã ãã
 ãã¹ã¯ã¼ããä¸è´ãã¾ããã
 -Eãªãã·ã§ã³ãä»ãã¦%sãåå®è¡ãã¦ãã ããã
 ãããã°ã¢ã¼ãã§å®è¡ãã¦ãã¾ãã
 åé¤ãè¡ããªãã¢ã¼ãã§å®è¡ãã¦ãã¾ããå¤±æããå ´åã§ãåé¤ããã¾ããã
 ãã¼ã¿ãã¼ã¹ã¯ã©ã¹ã¿ã¯ã­ã±ã¼ã«%sã§åæåããã¾ãã
 ãã¼ã¿ãã¼ã¹ã¯ã©ã¹ã¿ã¯ä»¥ä¸ã®ã­ã±ã¼ã«ã§åæåããã¾ãã
  COLLATE:  %s
  CTYPE:    %s
  MESSAGES: %s
  MONETARY: %s
  NUMERIC:  %s
  TIME:     %s
 ããã©ã«ãã®ãã¼ã¿ãã¼ã¹ç¬¦å·åæ¹å¼ã¯%sã«è¨­å®ããã¾ããã
 ããã©ã«ãã®ãã­ã¹ãæ¤ç´¢è¨­å®ã¯%sã«è¨­å®ããã¾ããã
 é¸æããç¬¦å·åæ¹å¼(%s)ã¨é¸æããã­ã±ã¼ã«ãä½¿ç¨ããç¬¦å·åæ¹å¼(%s)
ãåããã¾ããããã©ããä¸æã§ããããã«ããåç¨®ã®æå­åå¦çé¢æ°
ãä¸æ­£ãªåä½ãããå¯è½æ§ãããã¾ããæç¤ºçãªç¬¦å·åæ¹å¼ã®æå®ãæ­¢
ãããåè´ããçµã¿åãããé¸æãã¦%sãåå®è¡ãã¦ãã ãã
 ãã¼ã¿ãã¼ã¹ã·ã¹ãã åã®ãã¡ã¤ã«ã®ææèã¯"%s"ã¦ã¼ã¶ã§ããã
ãã®ã¦ã¼ã¶ããµã¼ããã­ã»ã¹ãææããªããã°ãªãã¾ããã

 %sã§ã¯"postgres"ãã­ã°ã©ã ãå¿è¦ã§ããã"%s"ã¨åããã£ã¬ã¯ããªã«ãã
ã¾ããã§ããã
ã¤ã³ã¹ãã¬ã¼ã·ã§ã³ãæ¤æ»ãã¦ãã ããã
 "postgres"ãã­ã°ã©ã ã¯"%s"ã«ããã¾ãããã%sã¨åããã¼ã¸ã§ã³ã§
ã¯ããã¾ããã§ããã
ã¤ã³ã¹ãã¬ã¼ã·ã§ã³ãæ¤æ»ãã¦ãã ããã
 ã¤ã³ã¹ãã¬ã¼ã·ã§ã³ãç ´æãã¦ããã-Lãªãã·ã§ã³ã§æå®ãããã£
ã¬ã¯ããªãééã£ã¦ããããæå³ããå¯è½æ§ãããã¾ãã
 è©³ç´°ã¯"%s --help"ãè¡ã£ã¦ãã ããã
 ä½¿ç¨æ¹æ³:
 ã·ã°ãã«ãçºçãã¾ãã
 å­ãã­ã»ã¹ãçµäºã³ã¼ã%dã§çµäºãã¾ãã å­ãã­ã»ã¹ãæªç¥ã®ã¹ãã¼ã¿ã¹%dã§çµäºãã¾ãã å­ãã­ã»ã¹ãä¾å¤0x%Xã§çµäºãã¾ãã å­ãã­ã»ã¹ãã·ã°ãã«%dã§çµäºãã¾ãã å­ãã­ã»ã¹ãã·ã°ãã«%sã§çµäºãã¾ãã template1ããpostgresã¸ã³ãã¼ãã¦ãã¾ã ...  template1ããtemplate0ã¸ã³ãã¼ãã¦ãã¾ã ...  ãã£ã¬ã¯ããªã"%s"ã«å¤æ´ã§ãã¾ããã§ãã å®è¡ãã"%s"ãããã¾ããã§ãã ç¾å¨ã®ãã£ã¬ã¯ããªãè­å¥ã§ãã¾ããã§ãã: %s ãã£ã¬ã¯ããª"%s"ããªã¼ãã³ã§ãã¾ããã§ããã: %s
 ãã¤ããª"%s"ãèª­ã¿åãã¾ããã§ãã ãã£ã¬ã¯ããª"%s"ãèª­ã¿åãã¾ããã§ããã: %s
 ã·ã³ããªãã¯ãªã³ã¯"%s"ãèª­ã¿åãã§ãã¾ããã§ãã "%s"ã¨ãããã¡ã¤ã«ã¾ãã¯ãã£ã¬ã¯ããªãåé¤ã§ãã¾ããã§ããã: %s
 "%s"ã®junctionãè¨­å®ã§ãã¾ããã§ãã:  %s
 "%s"ã¨ãããã¡ã¤ã«ã¾ãã¯ãã£ã¬ã¯ããªã®æå ±ãåå¾ã§ãã¾ããã§ããã: %s
 å­ãã­ã»ã¹ã¸ã®æ¸ãè¾¼ã¿ãã§ãã¾ããã§ãã: %s
 è¨­å®ãã¡ã¤ã«ãä½æãã¦ãã¾ã ...  å¤æãä½æãã¦ãã¾ã ...  ãã£ã¬ã¯ããªãä½æãã¦ãã¾ã ...  ãã£ã¬ã¯ããª%sãä½æãã¦ãã¾ã ...  æå ±ã¹ã­ã¼ããä½æãã¦ãã¾ã ...  ãµããã£ã¬ã¯ããªãä½æãã¦ãã¾ã ...  ã·ã¹ãã ãã¥ã¼ãä½æãã¦ãã¾ã ...  %s/base/1ã«template1ãã¼ã¿ãã¼ã¹ãä½æãã¦ãã¾ã ...  ãã£ã¬ã¯ããª%sã®æ¨©éãè¨­å®ãã¦ãã¾ã ...  ä¾å­é¢ä¿ãåæåãã¦ãã¾ã ...  pg_authidãåæåãã¦ãã¾ã ...  ãã¤ããª"%s"ã¯ç¡å¹ã§ã ã·ã¹ãã ãªãã¸ã§ã¯ãã®å®ç¾©ãã­ã¼ããã¦ãã¾ã ...  ok
 ã¡ã¢ãªä¸è¶³ã§ã
 ããã©ã«ãã®max_connectionsãé¸æãã¦ãã¾ã ...  ããã©ã«ãã® shared_buffers ãé¸æãã¦ãã¾ã ...  ãã¹ã¯ã¼ããè¨­å®ãã¦ãã¾ã ...  çµã¿è¾¼ã¿ãªãã¸ã§ã¯ãã«æ¨©éãè¨­å®ãã¦ãã¾ã ...  template1ãã¼ã¿ãã¼ã¹ããã­ã¥ã¼ã ãã¦ãã¾ã ...  