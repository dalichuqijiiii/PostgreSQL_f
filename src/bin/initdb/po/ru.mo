��    �      $  �   ,      �
  R   �
     4  
   R  -   ]  �   �  �        �    �  J   �  5   =  J   s  6   �  P   �  C   F  :   �  ]   �  4   #  B   X  H   �  G   �  >   ,  9   k  3   �  ?   �  /     -   I  E   w  y   �  (   7  #   `  7   �  (   �  ,   �  3     '   F  3   n  D   �  -   �  -     /   C  "   s  6   �  +   �     �  0     ;   A  $   }  /   �     �  $   �  ~     1   �     �  /   �  J     �   _     '  C   :  -   ~  8   �  !   �  ,     /   4  4   d  A   �  @   �  ,     P   I  I   �  b   �     G     X  �   w  [   �     W     p     �  ;   �  9   �  �     >   �  ;   �    (  u   9   q   �   f   !!  s   �!  &   �!     #"     +"  &   :"  0   a"  .   �"  )   �"  )   �"  "   #  #   8#  "   \#      #  (   �#  "   �#     �#  "   $  !   *$  ,   L$  $   y$  *   �$  %   �$  !   �$     %     +%     F%      a%     �%     �%  -   �%  0   �%     &     8&     T&  )   h&     �&     �&  &   �&  3   �&      '  +   '  !   B'  �  d'  W   	)     a)     })  4   �)  �   �)  �   E*  $   �*  6   +  T   W,  4   �,  N   �,  8   0-  X   i-  L   �-  4   .  u   D.  ;   �.  4   �.  G   +/  N   s/  @   �/  4   0  :   80  J   s0  '   �0  /   �0  L   1  �   c1  &   2  !   42  5   V2  +   �2  5   �2  @   �2  *   /3  8   Z3  R   �3  0   �3  0   4  0   H4  (   y4  >   �4  +   �4     5  6   +5  B   b5  *   �5  6   �5     6  )   $6  |   N6  @   �6     7  5   +7  M   a7  �   �7     v8  ?   �8  0   �8  <   �8  $   ;9  0   `9  9   �9  =   �9  J   	:  O   T:  -   �:  d   �:  V   7;  ^   �;     �;  %   <  �   '<  n   �<     ,=     B=     a=  \   =  7   �=  �   >  .   �>  E   �>  .  %?  �   T@  q   �@  b   \A  f   �A  5   &B     \B     lB  /   B  8   �B  *   �B  %   C  %   9C  %   _C  &   �C  &   �C     �C  2   �C  '   $D      LD  )   mD  ,   �D  0   �D  &   �D  9   E  +   VE  %   �E     �E     �E     �E  "   �E     F  %   2F  (   XF  3   �F     �F     �F     �F  )   	G     3G     7G  9   HG  F   �G     �G  1   �G  #   H     <      1   F   T       -   t       z   B   A       i   q          ]       /   %   I   "       f   7   n           S       r           :   .           ^   D   0       j         '          y   �   $   G            N          5      4   +      [   u   J       w       h              &   x   C   >   P      #   V   E           a            O   @       9   c   ,          �       }   |       v       `              (   
       g          b                H   )       {   k      ~   R       m   d           \   ;   K   L   3   ?      !       l      8   U   Z   o      _       s          p      X           6   Q       W   *   e   Y          M   2   =           	    
If the data directory is not specified, the environment variable PGDATA
is used.
 
Less commonly used options:
 
Options:
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
   %s [OPTION]... [DATADIR]
   --lc-collate, --lc-ctype, --lc-messages=LOCALE
  --lc-monetary, --lc-numeric, --lc-time=LOCALE
                            initialize database cluster with given locale
                            in the respective category (default taken from
                            environment)
   --locale=LOCALE           initialize database cluster with given locale
   --no-locale               equivalent to --locale=C
   --pwfile=FILE             read password for the new superuser from file
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
 selecting default max_connections ...  selecting default shared_buffers/max_fsm_pages ...  setting password ...  setting privileges on built-in objects ...  vacuuming database template1 ...  Project-Id-Version: PostgreSQL 8.0
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2009-01-16 09:15+0000
PO-Revision-Date: 2009-03-29 09:47+0400
Last-Translator: Serguei A. Mokhov <mokhov@cs.concordia.ca>
Language-Team: pgsql-ru-general <pgsql-ru-general@postgresql.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Russian
X-Poedit-Country: RUSSIAN FEDERATION
 
���� ���������� ������ �� �������, ������������ �������� ���������� ��������� PGDATA.
 
����� ������������ �����:
 
�����:
 
��������� �� �������: <pgsql-bugs@postgresql.org>.
 
�����. �� ������ ������ ��������� ������ ��� ������:

    %s%s%spostgres%s -D %s%s%s
���
    %s%s%spg_ctl%s -D %s%s%s -l logfile start

 
��������: ������������ �������������� "trust" ��� ��������� �����������.
�� ������ ţ ��������, �������������� pg_hba.conf ��� ��������� ����� -A,
��� ��������� ���������� initdb.
   %s [�����]... [����������-������]
   --lc-collate, --lc-ctype, --lc-messages=������
  --lc-monetary, --lc-numeric, --lc-time=������
                            ���������������� ������� ��� ������ �
                            ��������� ������� � ��������������� ���������
                            (�������� �� ��������� ������� �� ���������)
   --locale=������           ���������������� ������� ��� ������ � ��������� �������
   --no-locale               ������������ --locale=C
   --pwfile=����             ������� ������ ��� ������ �������������� �� �����
   -?, --help                �������� ��� ������ � �����
   -A, --auth=�����          ����� �������������� �� ��������� ��� ��������� �����������
   -E, --encoding=���������  ���������� ��������� �� ��������� ��� ����� ���
   -L ����������             ��� ����� ������� �����
   -T, --text-search-config=������������
                            ������������ ��������������� ������ �� ���������
   -U, --username=���        ��� �������������� ���� ������
   -V, --version             �������� ������ � �����
   -W, --pwprompt            ��������� ������ ��� ������ ��������������
   -X, --xlogdir=XLOGDIR     ��������������� ��� ���������� ������� ����������
   -d, --debug               �������� ����� ���������� ���������
   -n, --noclean             �� ������� ����� ������
   -s, --show                �������� ���������� ���������
  [-D, --pgdata=]���-������  ��������������� ��� ����� �������� ��� ������
 %s �������������� ������� PostgreSQL.

 %s: "%s" �� �������� ������ ���������� �������
 %s: �� ������� ������������� ������. ����������, �������� �� ���� ��������.
 %s: ������ ��������� ��� root'��
����������, ������� ��� (�������������������) ������������ (��������,
��������� "su"), ��� ������� ����� ����������� ��������� �������.
 %s: ��� ������� � ���������� "%s": %s
 %s: ��� ������� � ����� "%s": %s
 %s: �� ������� �������� ����� �� ���������� "%s": %s
 %s: �� ������� ������� ���������� "%s": %s
 %s: �� ������� ������� ������������� ������ "%s": %s
 %s: �� � ��������� ���������� ���������� �������� ������ ������
 %s: �� ������� ��������� ������� "%s": %s
 %s: �� ������� ����� ���������� ��������� ��� ������ %s
 %s: �� ������� ����� ���������� ������������ ��������������� ������ ��� ������ %s
 %s: �� ������� ������� ���� "%s" ��� ������: %s
 %s: �� ������� ������� ���� "%s" ��� ������: %s
 %s: �� ������� ������� ������ �� ����� "%s": %s
 %s: �� ������� �������� � ���� "%s": %s
 %s: ���������� ������ "%s" �� ������� �� ������� ������������
 %s: ���������� "%s" ���������� �� �� �����
 %s: �������������� ���������
 %s: ������ ��� �������� ����������� ���������� ������
 %s: ������ ��� �������� ����������� ���������� ������� ����������
 %s: ������ ��� �������� ���������� ������
 %s: ������ ��� �������� ���������� ������� ����������
 %s: ���� "%s" �� ����������
 %s: ���� "%s" �� �������� ������� ������
 %s: ������� ���� "%s" �� ����������� PostgreSQL %s
��������� ���� ��������� ��� ������� ���������� ���� � ������� ����� -L.
 %s: ��������������� �������� ����� ������ ���� ���������� ��ԣ�
 %s: ��������� ��� ������ "%s"
 %s: ������ %s ������� �� �������������� ��������� %s
 %s: ���������� ������� ������ �������������� ��� ��������� �������������� %s
 %s: ���������� ������ �� �������
�� ������ ������� ���������� ��� ������������ ������ ���
��� ���� �������.  ��� ����� ������� � ������� �������� ����� -D
��� ��������� ���������� ��������� PGDATA.
 %s: �� ������� ������
 %s: ������ ��������� ������������ ������ ������ � ���� �������
 %s: �������� ����������� ���������� ������ "%s"
 %s: �������� ����������� ���������� ������� ���������� "%s"
 %s: �������� ���������� ������ "%s"
 %s: �������� ���������� ������� ���������� "%s"
 %s: ���������� ������ �� �������������� �� ���� ��������� %s: ������� ����� ���������� ��������� ������ (������: "%s")
 %s: ���������� ������� ���������� "%s" �� ������� �� ������� ������������
 %s: ��������������� ���������� ������� ���������� ������ ���� ���������� ��ԣ�
 %s: �������������� ����� �������������� "%s"
 %s: ��������: ��������� ������������ ��������������� ������ "%s" ����� �� ��������������� ������ %s
 %s: ��������: ���������� ������������ ��������������� ������ ��� ������ %s ����������
 ��������� %s ����������� � �������� ��������� �������.
������������� %s ������ ������ ������.
 ������� ��� �����:  ������� ����� ������ ��������������:  ���� �� ������ ������� ����� ������� ��� ������, ������� ���� ��� 
���������� "%s" ��� ţ ���������� ��� ��������� %s
� ���������� �������� �� "%s".
 ���� �� ������������� ������ ������� ������ ���������� �����, �������
���������� "%s" ���� �ӣ ţ ����������.
 ������ �� ���������.
 ������������� %s � ������ -E.
 ���������� � ������ �������.
 ���������� � ������ 'noclean'.  ������ ������ � ������ ����� ������ ������������� �� �����.
 ������� ��� ������ ����� ��������������� � ������� %s.
 ������� ��� ������ ����� ��������������� �� ���������� ��������:
  COLLATE:  %s
  CTYPE:    %s
  MESSAGES: %s
  MONETARY: %s
  NUMERIC:  %s
  TIME:     %s
 ��������� ���� �� ��������� ����������� � %s.
 ������������ ��������������� ������ �� ��������� ����������� � "%s".
 ��������� ������� �� ������� (%s) � ��������� ���������
������ (%s) �� ���������.  ��� ����� �������� � �����������
����������� � ��������� �������� ��������� � ���������� �����. 
��� �����������  ������������� %s �, ���� �� ����������
���������, ���� ������� ���������� ���������� ��������� � ������.
 �����, ������������� ���� ������� ��� ������, �����
������������ ������������ "%s". ���� ������������
����� ������ ���� ���������� �������� �������.
 ��������� "postgres" ����� ��� %s, �� ��� �� ������� � 
��� �� ����������, ��� � "%s".
��������� ���� ���������.
 ��������� "postgres" ������� ����� � %s, �� ��
� ��� �� ������� ��� %s.
��������� ���� ���������.
 ��� ��������, ��� � ��� �������� � ���������� ��� �������
������������ ���������� � ����� ������� -L.
 �������� "%s --help" ��� ����� ��������� ����������.
 �������������:
 ���������� ������
 �������� ������� ���������� � ����� �������� %d �������� ������� ���������� � �������������� �������� %d �������� ������� �����ۣ� ����������� 0x%X �������� ������� �����ۣ� �������� %d �������� ������� �����ۣ� �������� %s ����������� template1 � postgres ...  ����������� template1 � template0 ...  �� ������� �������� ���������� �� "%s" "%s" �� ������ ��� ���������� �� ������� ���������������� ������� ����������: %s �� ������� ������� ���������� "%s": %s
 �� ������� ������� �������� "%s" �� ������� ��������� ���������� "%s": %s
 �� ������� ������� ������������� ������ "%s" �� ������� ������� ���� ��� ���������� "%s": %s
 �� ������� ������� ����� ��� "%s": %s
 �� ������� �������� ������ ����� ��� ���������� "%s": %s
 �� ������� �������� � �������� �������: %s
 �������� ���������������� ������ ...  �������� ��������� ...  �������� �������� ...  �������� ���������� %s ...  �������� �������������� ����� ...  �������� ������������� ...  �������� ��������� ������������� ...  �������� ���� template1 � %s/base/1 ...  ����������� ���� �� ������������ ���������� %s ...  ������������� ������������ ...  ������������� pg_authid ...  �������� �������� "%s" �������� ��������� �������� �������� ...  ��
 �������� ������
 ���������� �������� �� ��������� ��� max_connections ...  ���������� �������� �� ��������� ��� shared_buffers/max_fsm_pages ...  ��������� ������ ...  ��������� ���������� ��� ���������� �������� ...  ������ ������ � ���� template1 ...  