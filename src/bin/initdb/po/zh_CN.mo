��    �      <  �   \      (  R   )     |  
   �     �  -   �  �   �  �   n      A     5   X  J   �     �  6   �  P   ,  C   }  :   �  ]   �  4   Z  B   �  H   �  G     >   c  9   �  3   �  ?     /   P  -   �  E   �  y   �  (   n  #   �  7   �  (   �  ,     3   I  '   }  3   �  D   �  (     8   G  -   �  -   �  /   �  "     6   /  +   f     �  0   �  ;   �  $     /   ;     k  $   �  ~   �  1   -     _  /   }  J   �  �   �     �  C   �  -     8   E  !   ~  ,   �  /   �  4   �  A   2  @   t  ,   �  P   �  I   3  b   }     �     �  �     [   �     �     	     '  ;   ?  9   {  �   �  >   F  ;   �    �  u   �   q   H!  f   �!  s   !"  &   �"     �"     �"  &   �"  0   �"  .   +#  )   Z#  )   �#  "   �#  #   �#  "   �#      $  (   9$  "   b$     �$  "   �$  !   �$  ,   �$  $   %  *   7%  %   b%  !   �%     �%     �%     �%      �%     &     8&  -   S&  0   �&     �&     �&     �&  )   '     +'     /'  &   >'  %   e'     �'  +   �'  !   �'  `  �'  -   P)     ~)     �)     �)  (   �)  �   �)  j   S*  �   �*  6   �+  .   �+  ;   ,     J,  1   d,  3   �,  3   �,  +   �,  E   *-  -   p-  3   �-  9   �-  8   .  /   E.  )   u.  )   �.  /   �.  $   �.  &   /  &   E/  [   l/     �/     �/  !   �/      0     ;0     Z0     z0  &   �0  *   �0     �0     1  $   %1  "   J1  !   m1     �1  +   �1     �1     �1     
2     $2     D2     Z2     p2     �2  Q   �2     �2     3  &   13  3   X3  b   �3     �3  %   �3     #4  !   A4     c4  "   z4  "   �4  #   �4  *   �4  %   5     55  9   M5  /   �5  C   �5     �5     6  X   6  0   x6     �6     �6     �6  '   �6  !   
7  |   ,7  %   �7  #   �7  �   �7  G   �8  G   �8  ?   :9  ;   z9  !   �9  
   �9  	   �9     �9     :  !   !:     C:     X:      m:      �:     �:     �:     �:     �:     ;     ;     3;     I;     f;  "   ;     �;     �;     �;     �;     �;     �;     <     %<  )   7<     a<     <     �<     �<     �<     �<  	   �<  )   �<  ,   =     B=     P=     h=            X       m   C   U   e              q   Q   "       ^   ;   k       E   @   {   *       i          _           v          |   d      >   A   u      ?   +   o      t      h       J   �   c   [   Y   n   ]   1   a   P   W       b   D       j   �   !                         N           #   B   H      2   %   3   <          R   S   )   =   l   .             :              6      �   	   M              /       �   g      O              f               '       K   p      �      -   `   5   $   F   8              9   y   L   w   \       &       0       s             z   r       Z          
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
 selecting default max_connections ...  selecting default shared_buffers ...  setting password ...  setting privileges on built-in objects ...  vacuuming database template1 ...  Project-Id-Version: PostgreSQL 8.0
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2010-02-19 01:52+0000
PO-Revision-Date: 2010-03-30 13:49+0800
Last-Translator: Weibin <ssmei_2000@yahoo.com>
Language-Team: Weiping He <laser@zhengmai.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
 
���û��ָ������Ŀ¼, ��ʹ�û������� PGDATA
 
����ͨʹ��ѡ��:
 
ѡ��:
 
����ѡ��:
 
��������� <pgql-bugs@postgresql.org>.
 
�ɹ�. �����ڿ���������������������ݿ������:

    %s%s%s%spostmaster -D %s%s%s
����
    %s%s%s%spg_ctl -D %s%s%s -l logfile start

 
����: Ϊ�������������� "trust" ��֤.
�����ͨ���༭ pg_hba.conf ���Ļ�����
������ initdb ʱʹ�� -A ѡ��.
   --lc-collate, --lc-ctype, --lc-messages=LOCALE
  --lc-monetary, --lc-numeric, --lc-time=LOCALE
                            Ϊ�µ����ݿ���ڸ��Ե�Ŀ¼�зֱ�
                   �趨ȱʡ���Ի�����Ĭ��ʹ�û�����
                   ��)
       --locale=LOCALE      Ϊ�����ݿ�����Ĭ�����Ի���
   --no-locale               ��ͬ�� --locale=C
   --pwfile=�ļ���           �����µĳ����û����ļ���ȡ����
   %s [ѡ��]... [DATADIR]
   -?, --help                ��ʾ�˰���, Ȼ���˳�
   -A, --auth=METHOD         �������ӵ�Ĭ����֤����
   -E, --encoding=ENCODING   Ϊ�����ݿ�����Ĭ�ϱ���
   -L DIRECTORY              �����ļ���λ��
   -T, --text-search-config=CFG
                   ȱʡ���ı���������
   -U, --username=NAME       ���ݿⳬ���û���
   -V, --version             ����汾��Ϣ, Ȼ���˳�
   -W, --pwprompt            �����µĳ����û���ʾ�������
   -X, --xlogdir=XLOGDIR          ��ǰ������־Ŀ¼��λ��
   -d, --debug               ���������ĳ�����Ϣ
   -n, --noclean             ����������
   -s, --show                ��ʾ�ڲ�����
   -D, --pgdata=DATADIR      ��ǰ���ݿ�ص�λ��
 %s ��ʼ��һ�� PostgreSQL ���ݿ��.

 %s: "%s" ����һ����Ч�ķ�������������
 %s: �����ļ�û������. �뱨���������.
 %s: �޷��� root �û�����
���Է��������������ߵ��û� (����Ȩ) ����
��½ (ʹ��, e.g., "su").
 %s: �޷�����Ŀ¼ "%s": %s
 %s: �޷������ļ� "%s": %s
 %s: �޷��ı�Ŀ¼ "%s" ��Ȩ��: %s
 %s: �޷�����Ŀ¼ "%s": %s
 %s: �޷������������� "%s": %s
 %s: �޷�ȷ����Ч�Ķ̰汾�ַ���
 %s: �޷�ִ������ "%s": %s
 %s: �޷�Ϊ locale "%s" �ҵ����ʵı���
 %s: �޷�Ϊ���Ի���"%s" �ҵ����ʵı�������
 %s: �޷���ȡ��ǰ�û�����: %s
 %s: �޷���õ�ǰ�û�����Ϣ: %s
 %s: Ϊ�˶�ȡ, �޷����ļ� "%s": %s
 %s: Ϊ��д, �޷����ļ� "%s": %s
 %s: �޷����ļ� "%s" ��ȡ����: %s
 %s: �޷�д�ļ� "%s": %s
 %s: ���û���Ҫ�������ݿ�Ŀ¼ "%s" ����ɾ��
 %s: Ŀ¼"%s"�Ѵ��ڣ������ǿյ�
 %s: ����: ���벻ƥ��
 %s: ɾ������Ŀ¼����ʧ��
 %s: ɾ��������־Ŀ¼������ʧ��
 %s: ɾ������Ŀ¼ʧ��
 %s: ɾ������Ŀ¼ʧ��
 %s: �ļ� "%s" ������
 %s: �ļ� "%s" ���ǳ����ļ�
 %s: �����ļ� "%s" ������ PostgreSQL %s
�����İ�װ��ʹ�� -L ѡ��ָ����ȷ��·��.
 %s: �����ļ�λ�ñ���Ϊ����·��
 %s: ��Ч�� locale ���� "%s"
 %s: ���Ի��� %sҪ��ʹ�ò�֧�ֵı���%s
 %s: Ϊ������ %s ��֤, ����ҪΪ�����û�ָ��һ������
 %s: û��ָ������Ŀ¼
������ȷ�ϴ����ݿ�ϵͳ����������Ŀ¼
����. ʹ�� -D ѡ�����
�������� PGDATA.
 %s: �ڴ����
 %s: ������ʾ�Ϳ����ļ�����ͬʱ��ָ��
 %s: ɾ������Ŀ¼ "%s" ������
 %s: ɾ��������־Ŀ¼ "%s" ������
 %s: ɾ������Ŀ¼ "%s"
 %s: ����ɾ��������־�ļ�Ŀ¼ "%s"
 %s: �����ƽ̨�ϲ�֧��ʹ�÷������� %s: �����в���̫�� (��һ���� "%s")
 %s: ���û���Ҫ���²�ɾ��������־Ŀ¼ "%s"
 %s: ������־Ŀ¼��λ�ñ���Ϊ����·��
 %s: δ֪��֤���� "%s".
 %s: ����: ��ָ�����ı���������"%s"���������Ի���%s��ƥ��
 %s: ����: �������Ի���%s���ʵ��ı���������δ֪
 ������������%s��Ϊ�������˱���.
ʹ��һ����ͬ�����Ի�����������%s .
 ������һ��:  �����µĳ����û�����:  ������봴��һ���µ����ݿ�ϵͳ, ��ɾ�������
Ŀ¼ "%s" �������д������� %s
������ "%s".
 �����Ҫ�洢������־����Ҫɾ���������Ŀ¼"%s".
 ���ƥ��.
 �� -E ѡ���������� %s.
 �����ڳ���ģʽ��. 
 ������ noclean ģʽ��. ���󽫲�������.
 ���ݿ�ؽ����� locale %s ��ʼ��.
 ���ݿ�ؽ�����һ�� locales ��ʼ��
  COLLATE:  %s
  CTYPE:    %s
  MESSAGES: %s
  MONETARY: %s
  NUMERIC:  %s
  TIME:     %s
 Ĭ�ϵ����ݿ�����Ѿ���Ӧ������Ϊ %s.
 ȱʡ���ı��������ý��ᱻ���õ�"%s"
 ��ѡ��ı��� (%s) ����ѡ������Ի���ʹ�õı��� (%s) ��ƥ���.
���������´�����ͬ�ַ����ĺ���ʱ��������.
Ҫ�޸�������, �������� %s ���Ҳ�Ҫ��ȷָ������, ������ѡ��һ��ƥ��
�������.

 ���ڴ����ݿ�ϵͳ���ļ�����Ϊ�û� "%s".
���û�Ҳ����Ϊ���������̵�����.
 %s ��Ҫ���� "postgres", ������ͬһ��Ŀ¼ "%s" ��û�ҵ�.

������İ�װ.
 %s �ҵ����� "postgres", ���ǺͰ汾 "%s" ��һ��.

������İ�װ.
 ����ζ�����İ�װ�����˴����
ʹ�� -L ѡ��ָ���˴����·��.
 ���� "%s --help" ��ȡ�������Ϣ.
 ʹ�÷���:
 �����ź�
 �ӽ������˳�, �˳���Ϊ %d �ӽ������˳�, δ֪״̬ %d �ӽ��̱�����(exception) 0x%X ��ֹ �ӽ��̱��ź� %d ��ֹ �ӽ��̱��ź� %s ��ֹ ���� template1 �� template0 ...  ���� template1 �� template0 ...  �޷�����Ŀ¼ "%s" δ���ҵ�һ�� "%s" ��ִ�� �޷�ȷ�ϵ�ǰĿ¼: %s �޷���Ŀ¼ "%s": %s
 �޷���ȡ�������� "%s" �޷���ȡĿ¼ "%s": %s
 �޷���ȡ�������� "%s" �޷�ɾ���ļ���Ŀ¼ "%s": %s
 �޷�Ϊ "%s"��������: %s
 �޷���ȡ�ļ���Ŀ¼ "%s"��״̬: %s
 �޷�д���ӽ���: %s
 ���������ļ� ...  �����ַ���ת�� ...  ���ڴ����ֵ� ...  ����Ŀ¼ %s ...  ������Ϣģʽ ...  ���ڴ�����Ŀ¼ ...  ����ϵͳ��ͼ ...  �� %s/base/1 �д��� template1 ���ݿ� ...  �޸��Ѵ���Ŀ¼ %s ��Ȩ�� ...  ��ʼ��dependencies ...  ��ʼ�� pg_authid ...   ��Ч�Ķ������� "%s" ���ڼ���ϵͳ�������� ... �ɹ�
 �ڴ����
 ѡ��Ĭ����������� (max_connections) ...  ѡ��Ĭ�Ϲ�����������С (shared_buffers) ...  ���ÿ��� ...  ���ڽ���������Ȩ�� ...  �������ݿ� template1 ...  