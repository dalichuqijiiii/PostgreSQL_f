��    k      t  �   �       	      !	     B	  &   T	     {	     �	  -   �	     �	     �	  |   
     �
  a   �
  K        f  A   �  !   �  3   �  ?     ?   Y  H   �  D   �  E   '  ?   m  >   �  9   �  B   &  <   i  z   �  0   !  F   R  >   �  8   �  2     O   D  7   �     �     �  �   �  !   m  C   �  y   �  C   M  D   �  >   �  A     *   W  /   �  %   �  /   �  #        ,  3   J  0   ~  ,   �  .   �  3     -   ?  0   m  5   �  "   �  $   �  J        g     �  3   �  0   �     �       !   1  $   S      x  -   �  4   �  %   �  $   "  "   G  F   j  F   �     �  7     )   D  q   n  f   �  %   G  &   m     �     �  &   �  0   �  .     )   B  )   l  "   �      �  (   �       !        @     X     l     �     �     �     �     �  "   �     �  �    1   �     �  /         ?  &   `  F   �     �     �  �   �  )   �   n   �   W   %!  $   }!  P   �!      �!  8   "  1   M"  G   "  @   �"  B   #  M   K#  6   �#  F   �#  7   $  ]   O$  B   �$  �   �$  -   z%  S   �%  I   �%  6   F&  ;   }&  r   �&  >   ,'     k'     t'  �   }'      9(  L   Z(  �   �(  X   e)  X   �)  \   *  U   t*  +   �*  1   �*  )   (+  2   R+  &   �+  #   �+  ;   �+  <   ,  2   I,  9   |,  H   �,  2   �,  4   2-  3   g-  %   �-  *   �-  R   �-     ?.     W.  <   t.  3   �.     �.     �.  "   /  %   >/  $   d/  7   �/  =   �/  %   �/  %   %0  $   K0  S   p0  M   �0     1  H   &1  '   o1  l   �1  d   2  )   i2  5   �2     �2     �2  /   �2  8   &3  *   _3  )   �3  %   �3  &   �3     4  ,   4      L4  !   m4     �4     �4     �4     �4     �4     5     5  '   -5  %   U5     {5               5      6         X                      (      9   .   #          d           '   R   Z   f   K   <   \   e      B   D   &       P   H          -   %              i   
   7       T   :                   G   A       4      C           [   *   b   Y   J                 c       _   	   F   @       !   "       ,   =      3       j               U   g      V                   S   L       1   $      ?   2       /      ]   O          N   k   8   +   >           a   h                 ^             Q   M       E   W           `   0       )   I   ;           
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
 Waiting for server startup...
 child process exited with exit code %d child process exited with unrecognized status %d child process was terminated by exception 0x%X child process was terminated by signal %d child process was terminated by signal %s could not change directory to "%s" could not find a "%s" to execute could not identify current directory: %s could not read binary "%s" could not read symbolic link "%s" could not start server
 invalid binary "%s" server shutting down
 server signaled
 server started
 server starting
 server stopped
 starting server anyway
 waiting for server to shut down... waiting for server to start... Project-Id-Version: PostgreSQL 8.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2009-01-16 09:17+0000
PO-Revision-Date: 2009-03-29 10:29+0400
Last-Translator: Serguei A. Mokhov <mokhov@cs.concordia.ca>
Language-Team: pgsql-ru-general <pgsql-ru-general@postgresql.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Russian
X-Poedit-Country: RUSSIAN FEDERATION
 
�����ۣ���� �������� �������� ��� ������� kill:
 
����� ������ ���������:
 
����� ��� ����������� � ������ � �����������:
 
����� ������� ��� �����������:
 
����� ��� ��������� ��� �����������:
 
�������� ��������� �� ������� �� �����  <pgsql-bugs@postgresql.org>.
 
������ ���������:
   %s kill   ���-������� PID
   %s register   [-N ���-������] [-U ���-������������] [-P ������] [-D ����������-������]
                    [-w] [-t �������] [-o "�����"]
   %s reload  [-D ����������-������] [-s]
   %s restart [-w] [-t �������] [-D ����������-������] [-s] [-m �����-���������]
                 [-o "�����"]
   %s start   [-w] [-t �������] [-D ����������-������] [-s] [-l ���-�����] [-o "�����"]
   %s status  [-D ����������-������]
   %s stop    [-W] [-t �������] [-D ����������-������] [-s] [-m �����-���������]
   %s unregister [-N ���-������]
   --help                 �������� ��� ��������� � �����
   --version              �������� ������ � �����
   -D, --pgdata ����������-������  ��������������� ��������� ��� ������
   -N ���-������   ��� ������ ��� ����������� ������� PostgreSQL
   -P ������    ������ �������� ��� ����������� ������� PostgreSQL
   -U ���-������������    ��� ������������ ��� ����������� ������� PostgreSQL
   -W                     �� ����� ���������� ��������
   -c, --core-files       ��������� postgres'� ������������ core-�����
   -c, --core-files       ����������� �� ���� ���������
   -l, --log ���-�����    ���������� (��� ���������) �������� ���������� ������� � ���-�����.
   -m �����-���������   ����� ���� "smart", "fast" ��� "immediate"
   -o �����               ����� �������o� ������ ��� �������� postgres'�
                         (������������ ����� ������� PostgreSQL)
   -p ����-�-POSTGRES     ������ �� ���������
   -s, --silent           �������� ������ ������, �������� �������������� ���������
   -t �������             ������� ������ ����� ��� ������������� ����� -w
   -w                     ����� �� ���������� ��������
   fast        ��������� ������,�� � ����������� ����������
   immediate   ����� ���������� ��� ����������� ���������; �����ģ� �
              �������������� ��� �����������
   smart       ��������� ������ ����� ���������� ���� ��������
  ������
  ������
 %s �������� �������� ��� �������, ���������, �����������,
������������ ���������������� ������, �������������� � ��������� �������
PostgreSQL, ��� �������� �������� PostgreSQL-��������.

 %s: PID-���� "%s" �� ����������
 %s: ��������, ������ ������ ��� �������, ������� ��������� ������ �ӣ �����
 %s: ������ ��������� ��� ������������� root
����������, ������� � ������� ��� ������������������� ������������  (��������, ��������� "su"),
��� ������� ����� ����������� ��������� �������.
 %s: ���������� ������������� ������; ����������� �������������������� ������ (PID: %ld)
 %s: ���������� ������������� ������; ����������� �������������������� ������ (PID: %ld)
 %s: �� ������� ���������� ����������� �� ������ core-�����; ���������� ֣����� ������������
 %s: �� ������� ���������� ������; ����������� �������������������� ������ (PID: %ld)
 %s: �� ������� ����� ���� ����������� ����
 %s: �� ������� ����� ����������� ���� postgres'�
 %s: �� ������� ������� PID-���� "%s": %s
 %s: �� ������� ������� ������ "%s": ��� ������ %d
 %s: ���������� ������� �������� �����
 %s: �� ������� ��������� ���� "%s"
 %s: �� ������� ���������������� ������ "%s": ��� ������ %d
 %s: �� ������� ��������� ������ ������������ (PID: %ld): %s
 %s: �� ������� ��������� ������ %d (PID: %ld): %s
 %s: �� ������� ��������� ������ ��������� (PID: %ld): %s
 %s: �� ������� ��������� ������
��������� ����� � ��������� ����������.
 %s: �� ������� ��������� ������, ��� ��������: %d
 %s: �� ������� ��������� ������ "%s": ��� ������ %d
 %s: ���������� ������� ������ "%s": ��� ������ %d

 %s: �������� ������ � PID-����� "%s"
 %s: ����������� ��������� ��� ������ kill
 %s: ���������� ��� ������ �� ������� � ���������� ��������� PGDATA �� �����������
 %s: ������� �� �������
 %s: ��� ����������� �������
 %s: ������ ��� ������ ������� ������� (PID: %ld) ����������
 %s: ���� ����� "%s" ������ ����� ����� ���� ������
 %s: �� ������� ������
 %s: ������ �� ���������������
 %s: ����������� ������ (PID: %ld)
 %s: ������ "%s" ��� ����������������
 %s: ������ "%s" �� ����������������
 %s: ����������� �������������������� ������ (PID: %ld)
 %s: ������� ����� ���������� ��������� ������ (������: "%s")
 %s: �������������� ����� ������ "%s"
 %s: ����������� ����� ��������� "%s"
 %s: �������������� ��� ������� "%s"
 (�� ���������, ����� ���������� ���������, �� �� � ������ ������� ��� �����������

 ���� ����� -D �� ������,�� ����� �������������� ���������� ��������� PGDATA.
 ������� �� ������?
 ����������, ���������� �������������������� ������ � ����������� �����.
 ������ ������� � ��������� �����������
 ��������� "postgres" ����� ��� %s, �� �� �������
� ��� �� ����������, ��� � "%s".
��������� ���� ���������.
 ��������� "postgres" ������� ����� � "%s",
�� �� ��� �� ������, ��� � %s.
��������� ���� ���������.
 ��������� ����� �������� ������� �������
 �������� "%s --help" ��� ����� ��������� ����������.
 �������������:
 �������� ������� �������...
 �������� ������� ���������� � ����� �������� %d �������� ������� ���������� � �������������� �������� %d �������� ������� �����ۣ� ����������� 0x%X �������� ������� ��� �������� �������� %d �������� ������� �����ۣ� �������� %s �� ������� �������� ���������� �� "%s" "%s" �� ������ ��� ���������� �� ������� ���������� ������� ����������: %s �� ������� ������� �������� "%s" �� ���������� ������� ������ "%s" �� ������� ��������� ������
 �������� �������� "%s" ������ ��������� ������
 ��������� ������ �������
 ������ �������
 ������ �����������
 ������ ����������
 ������ �����������, �������� �� �� ���
 �������� ���������� ������ �������... �������� ������� �������... 