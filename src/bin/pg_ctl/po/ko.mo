Þ    g      T           °      ±     Ò  &   ä     	     +	  -   J	     x	     	  r   «	     
  F   >
  A   
     Ç
  7   â
  !     3   <  ?   p  ?   °  H   ð  D   9  E   ~  ?   Ä  >     9   C  B   }  <   À  z   ý  0   x  F   ©  8   ð  2   )  O   \  7   ¬     ä     ë     ô  !     C   §  y   ë  C   e  D   ©  4   î  A   #  *   e  /     %   À  /   æ  #        :  3   X  0     ,   ½  .   ê  3     -   M  0   {  5   ¬  "   â  $     J   *     u       3   ¨  0   Ü             !   ?  $   a        -   §  4   Õ  %   
  $   0  "   U  F   x  F   ¿       7     q   R  f   Ä  &   +     R  &   Z  0     .   ²  )   á  )     "   5      X  (   y     ¢  !   ½     ß     ÷          !     2     B     S     c  "   {       N  ½  <        I  '   ]  4     4   º  ,   ï       !   3     U     Ö  J   ö  J   A       6   §  %   Þ  :      >   ?   V   ~   L   Õ   G   "!  >   j!  H   ©!  8   ò!  E   +"  F   q"  <   ¸"     õ"  4   #  Y   ¶#  >   $  W   O$  b   §$  N   
%     Y%     b%  Ô   k%  $   @&  T   e&  ã   º&  l   '  _   (  d   k(  K   Ð(  =   )  @   Z)  *   )  7   Æ)  *   þ)  %   )*  =   O*  9   *  5   Ç*  7   ý*  I   5+  5   +  =   µ+  N   ó+  /   B,  7   r,  U   ª,  5    -  #   6-  ?   Z-  E   -     à-  "   ö-  '   .  2   A.  1   t.  8   ¦.  4   ß.  &   /  !   ;/  $   ]/  c   /  J   æ/     10  @   Q0  ½   0     P1  *   ð1     2  8   '2  ?   `2  ;    2  4   Ü2  =   3  *   O3  *   z3  )   ¥3  '   Ï3  *   ÷3      "4     C4     `4  +   x4     ¤4     ¶4     Ñ4  $   æ4  .   5  1   :5     L   >       R   D          ;       4   )   :          N   Z   	   c   9   J   B       !   5   F   '                     X                  b   V   C   /   Y   +         %      ,      G   2      ?   Q              #   _         O       I   \      6   d                                 [      U          -       K      =           a   M   H   "               A   ^         S   .      T   *       <         ]   3   $          7   `       0   e   &   @       8   W           
   f         (   1       P          E   g    
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
                    [-w] [-o "OPTIONS"]
   %s reload  [-D DATADIR] [-s]
   %s restart [-w] [-D DATADIR] [-s] [-m SHUTDOWN-MODE] [-o "OPTIONS"]
   %s start   [-w] [-D DATADIR] [-s] [-l FILENAME] [-o "OPTIONS"]
   %s status  [-D DATADIR]
   %s stop    [-W] [-D DATADIR] [-s] [-m SHUTDOWN-MODE]
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
 %s: cannot set core size, disallowed by hard limit.
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
 The program "postgres" is needed by %s but was not found in the
same directory as "%s".
Check your installation.
 The program "postgres" was found by "%s"
but was not the same version as %s.
Check your installation.
 Try "%s --help" for more information.
 Usage:
 child process exited with exit code %d child process exited with unrecognized status %d child process was terminated by exception 0x%X child process was terminated by signal %d child process was terminated by signal %s could not change directory to "%s" could not find a "%s" to execute could not identify current directory: %s could not read binary "%s" could not read symbolic link "%s" could not start server
 invalid binary "%s" server shutting down
 server signaled
 server started
 server starting
 server stopped
 starting server anyway
 waiting for server to shut down... waiting for server to start... Project-Id-Version: PostgreSQL 8.3dev
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2007-02-09 01:13-0400
PO-Revision-Date: 2007-02-10 01:13+0900
Last-Translator: Ioseph Kim <ioseph@uri.sarang.net>
Language-Team: KOREAN <pgsql-kr@postgresql.or.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
 
ì¬ì©í  ì ìë ì¤ì§ì©(for kill) ìê·¸ë ì´ë¦:
 
ì¼ë° ìµìë¤:
 
ìë¹ì¤ ë±ë¡/ì ê±°ì© ìµìë¤:
 
start, restart ë ì¬ì©í  ì ìë ìµìë¤:
 
stop, restart ë ì¬ì© í  ì ìë ìµìë¤:
 
ì¤ë¥ë³´ê³ : <pgsql-bugs@postgresql.org>.
 
ì¤ì§ë°©ë² ì¤ëª:
   %s kill    ìê·¸ëì´ë¦ PID
   %s register   [-N ìë¹ì¤ì´ë¦] [-U ì¬ì©ì] [-P ë¹ë°ë²í¸] [-D DATADIR]
                    [-w] [-o "ìë²ìµì"]
   %s reload  [-D DATADIR] [-s]
   %s restart [-w] [-D DATADIR] [-s] [-m ì¤ì§ë°©ë²] [-o "ìë²ìµì"]
   %s start   [-w] [-D DATADIR] [-s] [-l ë¡ê·¸íì¼] [-o "ìë²ìµì"]
   %s status  [-D DATADIR]
   %s stop    [-W] [-D DATADIR] [-s] [-m ì¤ì§ë°©ë²]
   %s unregister [-N ìë¹ì¤ì´ë¦]
   --help                 ëìë§ì ë³´ì¬ì£¼ê³  ë§ì¹¨
   --version              ë²ì  ì ë³´ë¥¼ ë³´ì¬ì£¼ê³  ë§ì¹¨
   -D, --pgdata DATADIR   ë°ì´í°ë² ì´ì¤ ìë£ê° ì ì¥ëì´ìë ëë í ë¦¬
   -N SERVICENAME  ìë¹ì¤ ëª©ë¡ì ë±ë¡ë  PostgreSQL ìë¹ì¤ ì´ë¦
   -P PASSWORD     ì´ ìë¹ì¤ë¥¼ ì¤íí  ì¬ì©ìì ë¹ë°ë²í¸
   -U USERNAME     ì´ ìë¹ì¤ë¥¼ ì¤íí  ì¬ì©ì ì´ë¦
   -W                     ììì´ ëë  ëê¹ì§ ê¸°ë¤ë¦¬ì§ ìì
   -c, --core-files       ì½ì´ ë¤í íì¼ì ë§ë¬
   -c, --core-files       ì´ íë«í¼ììë ì¬ì©í  ì ìì
   -l, --log íì¼ì´ë¦     ìë² ë¡ê·¸ë¥¼ ì´ íì¼ì ê¸°ë¡í¨
   -m ì¤ì§ë°©ë²   "smart", "fast", "immediate" ì¤ íë
   -o ìµìë¤              PostgreSQL ìë²íë¡ê·¸ë¨ì¸ postgres ì¤íí  ë
                         ì¬ì©í  ëªë ¹í ìµìë¤
   -p PATH-TO-POSTGRES    ë³´íµì íìì¹ ìì
   -s, --silent           ì¼ë°ì ì¸ ë©ìì§ë ë³´ì´ì§ ìê³ , ì¤ë¥ë§ ë³´ì¬ì¤
   -w                     ììì´ ëë  ëê¹ì§ ê¸°ë¤ë¦¼
   fast        í´ë¼ì´ì¸í¸ì ì°ê²°ì ê°ì ë¡ ëê³  ì ìì ì¼ë¡ ì¤ì§ ë¨
   immediate   ê·¸ë¥ ë¬´ì¡°ê±´ ì¤ì§í¨; ë¤ì ììí  ë ë³µêµ¬ ììì í  ìë ìì
   smart       ëª¨ë  í´ë¼ì´ì¸í¸ì ì°ê²°ì´ ëê¸°ê² ëë©´ ì¤ì§ ë¨
  ìë£
  ì¤í¨
 %s íë¡ê·¸ë¨ì PostgreSQL ìë¹ì¤ë¥¼ ìì, ì¤ì§, ì¬ìì, íê²½ì¤ì  ì¬ì ì©,
ìë² ìí ë³´ê¸°, ëë PostgreSQL íë¡ì¸ì¤ì í¹ì  ìê·¸ëì ë³´ë¼ ì ìë
íë¡ê·¸ë¨ìëë¤.

 %s: "%s" PID íì¼ì´ ììµëë¤
 %s: ë¤ë¥¸ ìë²ê° ê°ë ì¤ì¸ ê² ê°ì; ì´ì§¸ë  ìë² ê°ëì ìëí¨
 %s: rootë¡ ì´ íë¡ê·¸ë¨ì ì¤ííì§ ë§ì­ìì¤
ìì¤íê´ë¦¬ì ê¶íì´ ìë, ìë²íë¡ì¸ì¤ì ìì ì£¼ê° ë  ì¼ë° ì¬ì©ìë¡
ë¡ê·¸ì¸ í´ì("su", "runas" ê°ì ëªë ¹ ì´ì©) ì¤ííì­ìì¤.
 %s: ìë² íê²½ì¤ì ì ë¤ì ë¶ë¬ì¬ ì ìì; ë¨ì¼ ì¬ì©ì ìë²ê° ì¤í ì¤ì (PID: %ld)
 %s: ìë²ë¥¼ ë¤ì ìì í  ì ìì; ë¨ì¼ì¬ì©ì ìë²ê° ì¤í ì¤ì (PID: %ld)
 %s: ì½ì´ í¬ê¸°ë¥¼ ì§ì í  ì ìì, íëëì¤í¬ ì©ë ì´ê³¼ë¡ íì©ëì§ ììì.
 %s: ìë² ì¤ì§ ì¤í¨; ë¨ì¼ ì¬ì©ì ìë²ê° ì¤í ì¤ (PID: %ld)
 %s: ì¤í ê°ë¥í íë¡ê·¸ë¨ì ì°¾ì ì ììµëë¤
 %s: ì¤í ê°ë¥í postgres íë¡ê·¸ë¨ì ì°¾ì ì ìì
 %s: "%s" PID íì¼ì ì´ ì ìì: %s
 %s: "%s" ìë¹ì¤ë¥¼ ì´ ì ìì: ì¤ë¥ ì½ë %d
 %s: ìë¹ì¤ ê´ë¦¬ìë¥¼ ì´ ì ìì
 %s: "%s" íì¼ì ì½ì ì ìì
 %s: "%s" ìë¹ì¤ë¥¼ ë±ë¡í  ì ìì: ì¤ë¥ ì½ë %d
 %s: reload ìê·¸ëì ë³´ë¼ ì ìì (PID: %ld): %s
 %s: %d ìê·¸ëì ë³´ë¼ ì ìì (PID: %ld): %s
 %s: stop ìê·¸ëì ë³´ë¼ ì ìì (PID: %ld): %s
 %s: ìë²ë¥¼ ìì í  ì ìì
ë¡ê·¸ ì¶ë ¥ì ì´í´ë³´ì­ìì¤.
 %s: ìë²ë¥¼ ììí  ì ìì: ì¢ë£ ì½ë %d
 %s: "%s" ìë¹ì¤ë¥¼ ììí  ì ìì: ì¤ë¥ ë²í¸ %d
 %s: "%s" ìë¹ì¤ë¥¼ ìë¹ì¤ ëª©ë¡ìì ëº ì ìì: ì¤ë¥ ì½ë %d
 %s: "%s" PID íì¼ì ìëª»ë ê°ì´ ìì
 %s: kill ììì íìí ì¸ìê° ë¹ ì¡ìµëë¤
 %s: -D ìµìë ìê³ , PGDATA íê²½ë³ìê°ë ì§ì ëì´ ìì§ ììµëë¤.
 %s: ìíí  ììì ì§ì íì§ ìììµëë¤
 %s: ê°ë ì¤ì¸ ìë²ê° ìì
 %s: ì´ì  ìë² íë¡ì¸ì¤(PID: %ld)ê° ìì´ì¡ìµëë¤
 %s: "%s" íê²½ì¤ì íì¼ì ë°ëì í ì¤ì ê°ì ¸ì¼íë¤?
 %s: ë©ëª¨ë¦¬ ë¶ì¡±
 %s: ìë²ë¥¼ ë©ì¶ì§ ëª»íì
 %s: ìë²ê° ì¤í ì¤ì (PID: %ld)
 %s: "%s" ìë¹ì¤ê° ì´ë¯¸ ë±ë¡ ëì´ ìì
 %s: "%s" ìë¹ì¤ê° ë±ë¡ëì´ ìì§ ìì
 %s: ë¨ì¼ ì¬ì©ì ìë²ê° ì¤í ì¤ì (PID: %ld)
 %s: ëë¬´ ë§ì ëªë ¹í ì¸ìë¤ (ìì "%s")
 %s: ì ì ìë ìì ëª¨ë "%s"
 %s: ìëª»ë ì¤ì§ ë°©ë² "%s"
 %s: ìëª»ë ìê·¸ë ì´ë¦ "%s"
 (ê¸°ë³¸ ì¤ì ì ì¤ì§ í  ëë ê¸°ë¤ë¦¬ê³ , ììì´ë ì¬ììí  ëë ì ê¸°ë¤ë¦¼.)
 -D ìµìì ì¬ì©íì§ ìì¼ë©°, PGDATA íê²½ë³ìê°ì ì¬ì©í¨.
 ìë²ê° ì¤í ì¤ìëê¹?
 ë¨ì¼ ì¬ì©ì ìë²ë¥¼ ë©ì¶ê³  ë¤ì ìëíì­ìì¤.
 %s íë¡ê·¸ë¨ì "postgres" íë¡ê·¸ë¨ì íìë¡ í©ëë¤. ê·¸ë°ë°, ì´ íì¼ì´
"%s" íì¼ì´ ìë ëë í ë¦¬ ìì ììµëë¤.
ì¤ì¹ ìíë¥¼ íì¸í´ ì£¼ì­ìì¤.
 "%s" íë¡ê·¸ë¨ì "postgres" íë¡ê·¸ë¨ì ì°¾ìì§ë§ ì´ íì¼ì
%s íë¡ê·¸ë¨ì ë²ì ê³¼ íë¦½ëë¤.
ì¤ì¹ ìíë¥¼ íì¸í´ ì£¼ì­ìì¤.
 ë³´ë¤ ìì¸í ì¬ì©ë²ì "%s --help"
 ì¬ì©ë²:
 íì íë¡ì¸ì¤ê° ì¢ë£ëìì, ì¢ë£ ì½ë %d íì íë¡ì¸ì¤ê° ì¢ë£ëìì, ìì ìë ìí %d 0x%X ìì¸ì²ë¦¬ë¡ íì íë¡ì¸ì¤ê° ì¢ë£ëìì íì íë¡ì¸ì¤ê° ì¢ë£ëìì, ìê·¸ë %d %s ìê·¸ë ê°ì§ë¡ íì íë¡ì¸ì¤ê° ì¢ë£ëìì "%s" ëë í ë¦¬ë¡ ì´ë í  ì ìì ì¤íí  "%s" íì¼ì ì°¾ì ì ìì íì¬ ëë í ë¦¬ë¥¼ ì ì ìì: %s "%s" ì´ì§ íì¼ì ì½ì ì ìì "%s" ì¬ë²ë¦­ ë§í¬ë¥¼ ì½ì ì ìì ìë²ë¥¼ ìì í  ì ìì
 ìëª»ë ì´ì§ íì¼ "%s" ìë²ë¥¼ ë©ì¶¥ëë¤
 ìë²ê° ìì¤í ìê·¸ëì ë°ìì
 ìë² ììë¨
 ìë²ë¥¼ ììí©ëë¤
 ìë² ë©ì¶ìì
 ì´ì§¸ë  ìë²ë¥¼ ììí©ëë¤
 ìë²ë¥¼ ë©ì¶ê¸° ìí´ ê¸°ë¤ë¦¬ë ì¤... ìë²ë¥¼ ììíê¸° ìí´ ê¸°ë¤ë¦¬ë ì¤... 