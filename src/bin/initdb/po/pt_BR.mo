��    �      4  �   L        R        l  
   �     �  -   �  �   �  �   ^    �  A     5   H  J   ~     �  6   �  P     C   m  :   �  ]   �  4   J  B     H   �  G     >   S  9   �  3   �  ?      /   @  -   p  y   �  (     #   A  7   e  (   �  ,   �  '   �  3     D   O  (   �  8   �  -   �  -   $  /   R  "   �  6   �  +   �       0     ;   P  $   �  /   �     �  $   �  ~   $  1   �     �  /   �  J   #  �   n     6  C   I  -   �  8   �  !   �  ,     /   C  4   s  A   �  @   �  ,   +  P   X  I   �  b   �     V     g  �   �  [   
     f          �  ;   �  9   �  �   +  >   �  ;   �    7  u   H   q   �   f   0!  s   �!  &   "     2"     :"  &   I"  0   p"  .   �"  )   �"  )   �"  "   $#  #   G#  "   k#      �#  (   �#  "   �#     �#  "   $  !   9$  ,   [$  $   �$  *   �$  %   �$  !   �$      %     :%     U%      p%     �%     �%  -   �%  0   �%     (&     G&     c&  *   w&  )   �&     �&     �&  &   �&  %   '     ,'  +   B'  !   n'  �  �'  ^   )  ,   u)     �)     �)  -   �)  �   �)  �   �*  '  H+  a   p,  8   �,  T   -     `-  ;   ~-  X   �-  [   .  F   o.  f   �.  H   /  M   f/  E   �/  ;   �/  <   60  7   s0  <   �0  F   �0  <   /1  >   l1  �   �1  +   F2  (   r2  8   �2  )   �2  .   �2  )   -3  M   W3  _   �3  0   4  ;   64  3   r4  3   �4  -   �4  )   5  D   25  0   w5  #   �5  7   �5  D   6  *   I6  7   t6     �6  ,   �6  �   �6  =   �7  6   �7  M   �7  a   K8  �   �8     �9  ^   �9  4   :  A   6:  '   x:  4   �:  ;   �:  =   ;  Q   O;  B   �;  0   �;  q   <  a   �<  �   �<     =  %   �=  �   �=  ]   H>     �>  '   �>  #   �>  =   ?  S   K?  �   �?  @   K@  D   �@  b  �@  �   4B  }   �B  p   >C  }   �C  7   -D     eD     kD  0   D  2   �D  0   �D  *   E  *   ?E  %   jE  &   �E  %   �E  ,   �E  +   
F  %   6F     \F  #   {F  #   �F  3   �F  *   �F  <   "G  *   _G  '   �G     �G     �G     �G  !    H     "H     >H  2   ^H  5   �H      �H     �H     I  !    I  2   BI     uI     yI  )   �I  (   �I     �I  1   �I  &   !J           V       k   A   S   c              o   O   !       \   9   i       C   >   y   (       g          ]           t          z   b      <   ?   s          )   m      r      f       H   �       Y   W   l   [   /   _   N   U       `   B       h                                L           "   @   F   a   0   #   1   :          P   Q   '   ;   j   ,             8              4      �   	   K              -       �   e      M              d               %       I   n      �      +   ^   3   =   D   6              7   w   J   u   Z       $       .       q      ~       x   p       X          
   E         T       G       }          {   &   2       R          *   |   v   5        
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
 %s: cannot be run as root
Please log in (using, e.g., "su") as the (unprivileged) user that will
own the server process.
 %s: could not access directory "%s": %s
 %s: could not access file "%s": %s
 %s: could not change permissions of directory "%s": %s
 %s: could not create directory "%s": %s
 %s: could not create symbolic link "%s": %s
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
 creating configuration files ...  creating conversions ...  creating dictionaries ...  creating directory %s ...  creating information schema ...  creating subdirectories ...  creating system views ...  creating template1 database in %s/base/1 ...  fixing permissions on existing directory %s ...  initializing dependencies ...  initializing pg_authid ...  invalid binary "%s" loading PL/pgSQL server-side language ...  loading system objects' descriptions ...  ok
 out of memory
 selecting default max_connections ...  selecting default shared_buffers ...  setting password ...  setting privileges on built-in objects ...  vacuuming database template1 ...  Project-Id-Version: PostgreSQL 9.0
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2010-05-08 21:46-0300
PO-Revision-Date: 2005-10-04 22:36-0300
Last-Translator: Euler Taveira de Oliveira <euler@timbira.com>
Language-Team: Brazilian Portuguese <pgbr-dev@listas.postgresql.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Se o diretório de dados não for especificado, a variável de ambiente PGDATA
é utilizada.
 
Opções utilizadas com menos frequência:
 
Opções:
 
Outras opções:
 
Relate erros a <pgsql-bugs@postgresql.org>.
 
Sucesso. Você pode iniciar o servidor de banco de dados utilizando:

    %s%s%spostgres%s -D %s%s%s
ou
    %s%s%spg_ctl%s -D %s%s%s -l logfile start

 
AVISO: habilitando método de autenticação "trust" para conexões locais
Você pode mudá-lo editando o pg_hba.conf ou utilizando a opção -A na
próxima vez que você executar o initdb.
       --lc-collate, --lc-ctype, --lc-messages=LOCALE
      --lc-monetary, --lc-numeric, --lc-time=LOCALE
                               ajusta configuração regional padrão na respectiva categoria
                               para novos bancos de dados (o ambiente é assumido como padrão)
      --locale=LOCALE           ajusta configuração regional padrão para novos bancos de dados
       --no-locale              equivalente a --locale=C
       --pwfile=ARQUIVO         lê senha do novo super-usuário a partir do arquivo
   %s [OPÇÃO]... [DIRDADOS]
   -?, --help                   mostra essa ajuda e termina
   -A, --auth=MÉTODO            método de autenticação padrão para conexões locais
   -E, --encoding=CODIFICAÇÃO   ajusta a codificação padrão para novos bancos de dados
   -L DIRETÓRIO                 onde encontrar os arquivos de entrada
   -T, --text-search-config=CFG
                               configuração de busca textual padrão
   -U, --username=NOME          nome do super-usuário do banco de dados
   -V, --version                mostra informação sobre a versão e termina
   -W, --pwprompt               pergunta senha do novo super-usuário
   -X, --xlogdir=DIRXLOG        local do log de transação
   -d, --debug                  mostra saída da depuração
   -n, --noclean                não remove após erros
   -s, --show                   mostra definições internas
  [-D, --pgdata=]DIRDADOS       local do agrupamento de banco de dados
 %s inicializa um agrupamento de banco de dados PostgreSQL.

 %s: "%s" não é um nome de codificação do servidor válido
 %s: não pode ser executado como root
Por favor entre (utilizando, i.e., "su") como usuário (sem privilégios) que será
o dono do processo do servidor.
 %s: não pôde acessar diretório "%s": %s
 %s: não pôde acessar arquivo "%s": %s
 %s: não pôde mudar permissões do diretório "%s": %s
 %s: não pôde criar diretório "%s": %s
 %s: não pôde criar link simbólico "%s": %s
 %s: não pôde executar comando "%s": %s
 %s: não pôde encontrar codificação ideal para configuração regional %s
 %s: não pôde encontrar configuração de busca textual ideal para configuração regional %s
 %s: não pôde obter nome de usuário atual: %s
 %s: não pôde obter informação sobre usuário atual: %s
 %s: não pôde abrir arquivo "%s" para leitura: %s
 %s: não pôde abrir arquivo "%s" para escrita: %s
 %s: não pôde ler senha do arquivo "%s": %s
 %s: não pôde escrever arquivo "%s": %s
 %s: diretório de dados "%s" não foi removido a pedido do usuário
 %s: diretório "%s" existe mas não está vazio
 %s: codificação não corresponde
 %s: falhou ao remover conteúdo do diretório de dados
 %s: falhou ao remover conteúdo do diretório do log de transação
 %s: falhou ao remover diretório de dados
 %s: falhou ao remover diretório do log de transação
 %s: arquivo "%s" não existe
 %s: arquivo "%s" não é um arquivo regular
 %s: arquivo de entrada "%s" não pertence ao PostgreSQL %s
Verifique sua instalação ou especifique o caminho correto utilizando a opção -L.
 %s: local do arquivo de entrada deve ser um caminho absoluto
 %s: nome de configuração regional "%s" é inválido
 %s: configuração regional %s requer codificação %s que não é suportada
 %s: você precisa especificar uma senha para o super-usuário para habilitar a autenticação %s
 %s: nenhum diretório de dados foi especificado
Você deve identificar o diretório onde os dados para esse sistema de banco de dados
irá residir. Faça isso com o invocação da opção -D ou a
variável de ambiente PGDATA.
 %s: sem memória
 %s: opção para perguntar a senha e um arquivo de senhas não podem ser especificados juntos
 %s: removendo conteúdo do diretório de dados "%s"
 %s: removendo conteúdo do diretório do log de transação "%s"
 %s: removendo diretório de dados "%s"
 %s: removendo diretório do log de transação "%s"
 %s: links simbólicos não são suportados nessa plataforma %s: muitos argumentos de linha de comando (primeiro é "%s")
 %s: diretório do log de transação "%s" não foi removido a pedido do usuário
 %s: diretório do log de transação deve ter um caminho absoluto
 %s: método de autenticação desconhecido "%s"
 %s: aviso: configuração de busca textual especificada "%s" pode não corresponder a configuração regional %s
 %s: aviso: configuração de busca textual ideal para configuração regional %s é desconhecida
 Codificação %s não é permitida como  uma codificação do servidor.
Execute %s novamente com uma seleção de configuração regional diferente.
 Digite-a novamente:  Digite nova senha de super-usuário:  Se você quer criar um novo sistema de banco de dados, remova ou esvazie
o diretório "%s" ou execute %s
com um argumento ao invés de "%s".
 Se você quer armazenar o log de transação no mesmo, 
remova ou esvazie o diretório "%s".
 Senhas não correspondem.
 Execute novamente %s com a opção -E.
 Executando no modo de depuração.
 Executando no modo sem limpeza. Erros não serão removidos.
 O agrupamento de banco de dados será inicializado com configuração regional %s.
 O agrupamento de banco de dados será inicializado com configurações regionais
  COLLATE:  %s
  CTYPE:    %s
  MESSAGES: %s
  MONETARY: %s
  NUMERIC:  %s
  TIME:     %s
 A codificação padrão do banco de dados foi definida para %s.
 A configuração de busca textual padrão será definida como "%s".
 A codificação que você escolheu (%s) e a codificação que a configuração regional
selecionada utiliza (%s) não tem correspondência. Isto pode conduzir
a um comportamento inesperado em funções de processamento de cadeia de caracteres.
Execute novamente o %s e não especifique uma codificação explicitamente
ou escolha uma outra combinação.
 Os arquivos deste sistema de banco de dados pertencerão ao usuário "%s".
Esse usuário deve ser o dono do processo do servidor também.

 O programa "postgres" é requerido pelo %s mas não foi encontrado no
mesmo diretório que "%s".
Verifique sua instalação.
 O programa "postgres" foi encontrado pelo "%s"
mas não tem a mesma versão que %s.
Verifique sua instalação.
 Isso significa que você tem uma instalação corrompida ou especificou
o diretório errado com a invocação da opção -L.
 Tente "%s --help" para obter informações adicionais.
 Uso:
 sinal foi recebido
 processo filho terminou com código de saída %d processo filho terminou com status desconhecido %d processo filho foi terminado pela exceção 0x%X processo filho foi terminado pelo sinal %d processo filho foi terminado pelo sinal %s copiando template1 para postgres ...  copiando template1 para template0 ...  não pôde mudar diretório para "%s" não pôde encontrar o "%s" para executá-lo não pôde identificar diretório atual: %s não pôde abrir diretório "%s": %s
 não pôde ler o binário "%s" não pôde ler diretório "%s": %s
 não pôde ler link simbólico "%s" não pôde remover arquivo ou  diretório "%s": %s
 não pôde definir junção para "%s": %s
 não pôde executar stat no arquivo ou  diretório "%s": %s
 não pôde escrever em processo filho: %s
 criando arquivos de configuração ...  criando conversões ...  criando dicionários ...  criando diretório %s ...  criando esquema informação ...  criando subdiretórios ...  criando visões do sistema ...  criando banco de dados template1 em %s/base/1 ...  alterando permissões no diretório existente %s ...  inicializando dependências ...  inicializando pg_authid ...  binário "%s" é inválido carregando linguagem PL/pgSQL ... carregando descrições de objetos do sistema ...  ok
 sem memória
 selecionando max_connections padrão ...  selecionando shared_buffers padrão ...  definindo senha ...  definindo privilégios dos objetos embutidos ...  limpando banco de dados template1 ...  