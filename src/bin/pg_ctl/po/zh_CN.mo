��    l      |  �   �      0	      1	     R	  &   d	     �	     �	  -   �	     �	     
  |   +
     �
  a   �
  K   *     v  A   �  !   �  3   �  ?   )  ?   i  H   �  D   �  E   7  ?   }  >   �  9   �  B   6  <   y  z   �  0   1  F   b  >   �  8   �  2   !  O   T  7   �     �     �  �   �  !   }  C   �  y   �  C   ]  D   �  >   �  A   %  *   g  /   �  %   �  /   �  #        <  3   Z  0   �  ,   �  .   �  3     -   O  0   }  5   �  "   �  $     J   ,     w     �  3   �  0   �          "  !   A  $   c      �  -   �  4   �  %     $   2  "   W  F   z  F   �       7     )   T  q   ~  f   �  %   W  &   }     �  d   �       &   0  0   W  .   �  )   �  )   �  "         .  (   O     x  !   �     �     �     �     �               )     9  "   Q     t  X  �     �               "     6  )   J     t     �  k   �         Y   5   H   �      �   =   �      2!  2   Q!  0   �!  (   �!  5   �!  5   "  7   J"  *   �"  6   �"  ,   �"  A   #  >   S#  m   �#  (    $  6   )$  7   `$  *   �$  #   �$  +   �$  '   %     ;%     B%  e   I%     �%  3   �%  Q   �%  F   O&  @   �&  .   �&  @   '     G'  #   ]'     �'  !   �'     �'     �'  !   �'  $   (  #   9(  $   ](  %   �(  $   �(  !   �(  !   �(      )     2)  3   J)     ~)     �)  )   �)     �)     �)     *  !   *     ;*     U*  ,   m*  #   �*     �*     �*     �*  %   +  ,   -+     Z+  (   s+     �+  G   �+  ?   ,     B,  !   Z,  
   |,  O   �,     �,     �,     	-  !   #-     E-     Z-     o-     �-     �-     �-     �-     �-     �-     .     .     +.     ?.     S.     g.     {.     �.               5      6         Y                      (      9   .   #          e           '   R   [   W   K   <   ]   f      B   D   &       P   H          -   %              j   
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
 waiting for server to shut down... waiting for server to start... Project-Id-Version: PostgreSQL 8.0
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2010-02-19 01:59+0000
PO-Revision-Date: 2010-03-30 14:02+0800
Last-Translator: Weibin <ssmei_2000@yahoo.com>
Language-Team: Weiping He <laser@imsi.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
 
�����رյ��ź�����:
 
��ͨѡ��:
 
ע���ע����ѡ��:
 
������������ѡ��:
 
ֹͣ��������ѡ��:
 
���汨���� <pgsql-bugs@postgresql.org>.
 
�ر�ģʽ�����¼���:
   %s kill    �ź����� ���̺�
   %s register   [-N ��������] [-U �û���] [-P ����] [-D ����Ŀ¼]
              [-w] [-t ����] [-o "ѡ��"]
   %s reload  [-D ����Ŀ¼] [-s]
   %s restart [-w] [-t ����] [-D ����Ŀ¼] [-s] [-m �ر�ģʽ]
                [-o "ѡ��"]
   %s start   [-w]  [-t ����] [-D ����Ŀ¼] [-s] [-l �ļ���] [-o "ѡ��"]
   %s status  [-D ����Ŀ¼]
   %s stop   [-w]  [-t ����] [-D ����Ŀ¼] [-s] [-m �ر�ģʽ]
   %s unregister [-N ��������]
   --help                 ��ʾ�˰�����Ϣ, Ȼ���˳�
   --version              ��ʾ�汾��Ϣ, Ȼ���˳�
   -D, --pgdata ����Ŀ¼  ���ݴ洢��λ��
   -N ��������     ע�ᵽ PostgreSQL �������ķ�������
   -P ����         ע�ᵽ PostgreSQL �������ʻ��Ŀ���
   -U �û���       ע�ᵽ PostgreSQL �������ʻ����û���
   -W                     ���õȴ��������
   -c, --core-files       ����postgres���̲��������ļ�
   -c, --core-files       ������ƽ̨�ϲ�����
   -l, --log FILENAME     д�� (��׷��) ��������־���ļ� FILENAME
   -m SHUTDOWN-MODE   ������ "smart", "fast", ���� "immediate"
   -o OPTIONS             ���ݸ� postmaster ��������ѡ��
                         (PostgreSQL ������ִ���ļ�)
   -p PATH-TO-POSTMASTER  �����������Ҫ
   -s, --silent           ֻ��ӡ������Ϣ, û��������Ϣ
   -t SECS                ��ʹ��-w ѡ��ʱ��Ҫ�ȴ�������
   -w                     �ȴ�ֱ���������
   fast        ֱ���˳�, ��ȷ�Ĺر�
   immediate   ����ȫ�Ĺر��˳�; ������ָ�
   smart       ���пͻ��˶Ͽ����Ӻ��˳�
  ���
  ʧ��
 %s ��һ������, ֹͣ, ����, ���������ļ�, ���� PostgreSQL ������״̬,
����ɱ�� PostgreSQL ���̵Ĺ���

 %s: PID �ļ� "%s" ������
 %s: �������������̿�����������; ������������������
 %s: �޷��� root �û�����
���Է��������������û� (����Ȩ�û�) ��¼ (��ʹ�� "su")

 %s: �޷����¼��ط��������̣��������е��û�ģʽ�ķ��������� (PID: %ld)
 %s: �޷���������������; ���û�ģʽ������������������ (PID: %ld)
 %s: �������ú����ļ���С������;�����޶����
 %s: �޷�ֹͣ����������; �������� ���û�ģʽ����������(PID: %ld)
 %s: �޷��ҵ�ִ���ļ�
 %s: �޷��ҵ�postgres�����ִ���ļ�
 %s: �޷��� PID �ļ� "%s": %s
 %s: �޷��򿪷��� "%s": ������ %d
 %s: �޷��򿪷��������
 %s: �޷���ȡ�ļ� "%s"
 %s: �޷�ע����� "%s": ������ %d
 %s: �޷����������ź� (PID: %ld): %s
 %s: �޷������ź� %d (PID: %ld): %s
 %s: �޷�����ֹͣ�ź� (PID: %ld): %s
 %s: �޷���������������
�����־���.
 %s: �޷���������������: �˳���Ϊ %d
 %s: �޷��������� "%s": ������ %d
 %s: �޷�ע������ "%s": ������ %d
 %s: PID�ļ� "%s" �д�����Ч����
 %s: ȱ�� kill ģʽ����
 %s: û��ָ������Ŀ¼, ����û������ PGDATA ��������
 %s: û��ָ������
 %s:û�з�����������������
 %s: ԭ�еĽ���(PID: %ld)�����Ѿ���������
 %s: ѡ���ļ� "%s" ֻ����һ��
 %s: �ڴ����
 %s: server����û�йر�
 %s: �������з���������(PID: %ld)
 %s: ���� "%s" �Ѿ�ע����
 %s: ���� "%s" û��ע��
 %s: �������е��û�ģʽ���������� (PID: %ld)
 %s: �����в���̫�� (��һ���� "%s")
 %s: ��Ч�Ĳ���ģʽ "%s"
 %s: ��Ч�Ĺر�ģʽ "%s"
 %s: ��Ч�ź����� "%s"
 (Ĭ��Ϊ�رյȴ�, ����������������.)

 ���ʡ���� -D ѡ��, ��ʹ�� PGDATA ��������.
 �����������Ƿ���������?
 ����ֹ���û�ģʽ���������̣�Ȼ��������.
 �������������������ҽ�������
 %s ��Ҫ���� "postgres", ������ͬһ��Ŀ¼ "%s" ��û�ҵ�.

������İ�װ.
 %s �ҵ����� "postgres", ���ǺͰ汾 "%s" ��һ��.

������İ�װ.
 �ڵȴ�����������ʱ��ʱ
 ���� "%s --help" ��ȡ�������Ϣ.
 ʹ�÷���:
 ����: ���߱���ģʽ���ڼ���״̬
�ر����������ɣ�ֱ��������pg_stop_backup().
 �ȴ��������������� ...
 �ӽ������˳�, �˳���Ϊ %d �ӽ������˳�, δ֪״̬ %d �ӽ��̱�����(exception) 0x%X ��ֹ �ӽ��̱��ź� %d ��ֹ �ӽ��̱��ź� %s ��ֹ �޷�����Ŀ¼ "%s" δ���ҵ�һ�� "%s" ��ִ�� �޷�ȷ�ϵ�ǰĿ¼: %s �޷���ȡ�������� "%s" �޷���ȡ�������� "%s" �޷���������������
 ��Ч�Ķ������� "%s" ���ڹرշ���������
 ���������̷����ź�
 �����������Ѿ�����
 ������������������
 �����������Ѿ��ر�
 ������������������
 �ȴ����������̹ر� ... �ȴ��������������� ... 