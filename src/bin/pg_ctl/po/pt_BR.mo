��    m      �  �   �      @	      A	     b	  &   t	     �	     �	  -   �	     
  =   
     \
  |   y
     �
  a     K   x     �  A   �  !   !  3   C  ?   w  ?   �  H   �  D   @  E   �  ?   �  >     9   J  B   �  <   �  �     0   �  F   �  >     8   @  2   y  O   �  7   �     4     ;  �   D  !   �  C   �  y   ;  C   �  D   �  >   >  A   }  *   �  /   �  %     /   @  #   p     �  3   �  0   �  ,     .   D  3   s  -   �  0   �  5     *   <  "   g  $   �  J   �     �       3   -  0   a     �     �  !   �  $   �        -   ,  4   Z  %   �  $   �  "   �  F   �  F   D     �  7   �  )   �  k     `   m  %   �  &   �       d   #     �  &   �  0   �  .   �  )   .  )   X  "   �      �  (   �     �  !   
     ,     @     V     g     w     �     �  "   �     �  �  �  '   x     �  .   �  %   �  &      -   /      ]   ?   {      �   }   �       V!  g   w!  L   �!     ,"  F   H"  #   �"  5   �"  G   �"  M   1#  O   #  E   �#  H   $  K   ^$  C   �$  >   �$  M   -%  A   {%  �   �%  9   W&  L   �&  N   �&  F   -'  ?   t'  d   �'  A   (     [(     b(  �   j(  $   )  R   >)  �   �)  U   (*  T   ~*  ]   �*  P   1+  %   �+  <   �+  -   �+  7   ,  -   K,      y,  ;   �,  6   �,  .   -  5   <-  ;   r-  <   �-  9   �-  E   %.  8   k.  *   �.  &   �.  f   �.  $   ]/  %   �/  ?   �/  ;   �/     $0     60  )   R0  '   |0  (   �0  6   �0  =   1  ,   B1  +   o1  $   �1  L   �1  J   2     X2  >   v2  2   �2  w   �2  j   `3  2   �3  7   �3     64  z   <4      �4  0   �4  2   	5  0   <5  *   m5  *   �5  %   �5  ,   �5  +   6     B6  #   a6     �6     �6     �6     �6     �6     7     7      87     Y7               6      7         =          [           )      :   /   $          f           (   a   T   Y   M   >   _   g      D   F   '       R   J          .   &              k      8       U   ;                N   I   C   b   5      E               +       \   L   	   V          e          
   H   B       "   #   !   -   ?      4       l               W   i      X               ]   ^          2   %      A   3       0       `   Q          P   m   9   ,   @           d   j                               S   O   h   G   Z           c   1       *   K   <           
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
   %s init[db]               [-D DATADIR] [-s] [-o "OPTIONS"]
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
                         (PostgreSQL server executable) or initdb
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
 %s: database system initialization failed
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
 The program "%s" is needed by %s but was not found in the
same directory as "%s".
Check your installation.
 The program "%s" was found by "%s"
but was not the same version as %s.
Check your installation.
 Timed out waiting for server startup
 Try "%s --help" for more information.
 Usage:
 WARNING: online backup mode is active
Shutdown will not complete until pg_stop_backup() is called.

 Waiting for server startup...
 child process exited with exit code %d child process exited with unrecognized status %d child process was terminated by exception 0x%X child process was terminated by signal %d child process was terminated by signal %s could not change directory to "%s" could not find a "%s" to execute could not identify current directory: %s could not read binary "%s" could not read symbolic link "%s" invalid binary "%s" server shutting down
 server signaled
 server started
 server starting
 server stopped
 starting server anyway
 waiting for server to shut down... waiting for server to start... Project-Id-Version: PostgreSQL 9.0
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2010-05-08 21:45-0300
PO-Revision-Date: 2005-10-04 22:15-0300
Last-Translator: Euler Taveira de Oliveira <euler@timbira.com>
Language-Team: Brazilian Portuguese <pgbr-dev@listas.postgresql.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Sinais permitidos para sinalização:
 
Opções comuns:
 
Opções para registrar ou remover registro:
 
Opções para início ou reinício:
 
Opções para desligar ou reiniciar:
 
Relate erros a <pgsql-bugs@postgresql.org>.
 
Modos de desligamento são:
   %s init[db]               [-D DIRDADOS] [-s] [-o "OPÇÕES"]
   %s kill    NOME_SINAL PID
   %s register   [-N NOME_SERVIÇO] [-U USUÁRIO] [-P SENHA] [-D DIRDADOS]
                    [-w] [-t SEGS] [-o "OPÇÕES"]
   %s reload  [-D DIRDADOS] [-s]
   %s restart [-w] [-t SEGS] [-D DIRDADOS] [-s] [-m MODO-DESLIGAMENTO]
                 [-o "OPÇÕES"]
   %s start   [-w] [-t SEGS] [-D DIRDADOS] [-s] [-l ARQUIVO] [-o "OPÇÕES"]
   %s status  [-D DIRDADOS]
   %s stop    [-W] [-t SEGS] [-D DIRDADOS] [-s] [-m MODO-DESLIGAMENTO]
   %s unregister [-N NOME_SERVIÇO]
   --help                 mostra esta ajuda e termina
   --version              mostra informação sobre a versão e termina
   -D, --pgdata DIRDADOS  local da área de armazenamento dos bancos de dados
   -N NOME_SERVIÇO nome do serviço no qual se registrou o servidor PostgreSQL
   -P SENHA        senha da conta que registrou o servidor PostgreSQL
   -U USUÁRIO      nome do usuário que registrou o servidor PostgreSQL
   -W                     não espera até que a operação seja completada
   -c, --core-files       permite o postgres produzir arquivos core
   -c, --core-files       não é aplicável a esta plataforma
   -l, --log ARQUIVO      escreve (ou concatena) log do servidor para ARQUIVO
   -m MODO-DESLIGAMENTO   pode ser "smart", "fast" ou "immediate"
   -o OPÇÕES              opções de linha de comando passadas para o postgres
                         (executável do servidor PostgreSQL) ou initdb
   -p CAMINHO-DO-POSTGRES normalmente não é necessário
   -s, --silent           mostra somente erros, nenhuma mensagem informativa
   -t SEGS                segundos a esperar quando a opção -w for utilizada
   -w                     espera até que a operação seja completada
   fast        termina diretamente, com desligamento apropriado
   immediate   termina sem desligamento completo; conduzirá a uma recuperação durante o reinício
   smart       termina depois que todos os clientes desconectarem
 feito
 falhou
 %s é um utilitário que inicia, para, reinicia, recarrega arquivos de configuração,
relata o estado do servidor PostgreSQL ou envia um sinal a um processo do PostgreSQL.

 %s: arquivo do PID "%s" não existe
 %s: outro servidor pode estar executando; tentando iniciar o servidor assim mesmo
 %s: não pode ser executado como root
Por favor entre (utilizando "su") como um usuário (sem privilégios) que
será o dono do processo do servidor.
 %s: não pode recarregar servidor; servidor monousuário está executando (PID: %ld)
 %s: não pode reiniciar servidor; servidor monousuário está executando (PID: %ld)
 %s: não pode definir tamanho limite do arquivo core; não é permitido pelo limite superior
 %s: não pode parar servidor; servidor monousuário está executando (PID: %ld)
 %s: não pôde encontrar executável
 %s: não pôde encontrar o programa executável do postgres
 %s: não pôde abrir arquivo do PID "%s": %s
 %s: não pôde abrir serviço "%s": código de erro %d
 %s: não pôde abrir gerenciador de serviço
 %s: não pôde ler arquivo "%s"
 %s: não pôde registrar serviço "%s": código de erro %d
 %s: não pôde enviar sinal de recarga (PID: %ld): %s
 %s: não pôde enviar sinal %d (PID: %ld): %s
 %s: não pôde enviar sinal de parada (PID: %ld): %s
 %s: não pode iniciar o servidor
Examine o arquivo de log.
 %s: não pôde iniciar o servidor: código de saída foi %d
 %s: não pôde iniciar serviço "%s": código de erro %d
 %s: não pôde remover registro do serviço "%s": código de erro %d
 %s: inicialização do sistema de banco de dados falhou
 %s: dado inválido no arquivo do PID "%s"
 %s: faltando argumento para modo kill
 %s: nenhum diretório de banco de dados especificado e variável de ambiente PGDATA não foi definida
 %s: nenhuma operação especificada
 %s: nenhum servidor está executando
 %s: processo servidor antigo (PID: %ld) parece estar terminado
 %s: arquivo de opções "%s" deve ter exatamente uma linha
 %s: sem memória
 %s: servidor não desligou
 %s: servidor está executando (PID: %ld)
 %s: serviço "%s" já está registrado
 %s: serviço "%s" não está registrado
 %s: servidor monousuário está executando (PID: %ld)
 %s: muitos argumentos de linha de comando (primeiro é "%s")
 %s: modo de operação "%s" é desconhecido
 %s: modo de desligamento "%s" desconhecido
 %s: nome de sinal "%s" desconhecido
 (O padrão é esperar o desligamento, mas não para início ou reinício).

 Se a opção -D for omitida, a variável de ambiente PGDATA é utilizada.
 O servidor está executando?
 Por favor finalize o servidor monousuário e tente novamente.
 Servidor foi iniciado e está aceitando conexões
 O programa "%s" é requerido pelo %s mas não foi encontrado no
mesmo diretório que "%s".
Verifique sua instalação.
 O programa "%s" foi encontrado pelo "%s"
mas não tem a mesma versão que %s.
Verifique sua instalação.
 Tempo de espera esgotado para início do servidor
 Tente "%s --help" para obter informações adicionais.
 Uso:
 AVISO: modo cópia de segurança online está ativo
Desligamento não completará até que pg_stop_backup() seja chamado.
 Esperando o servidor iniciar...
 processo filho terminou com código de saída %d processo filho terminou com status desconhecido %d processo filho foi terminado pela exceção 0x%X processo filho foi terminado pelo sinal %d processo filho foi terminado pelo sinal %s não pôde mudar diretório para "%s" não pôde encontrar o "%s" para executá-lo não pôde identificar diretório atual: %s não pôde ler o binário "%s" não pôde ler link simbólico "%s" binário "%s" é inválido servidor está desligando
 servidor foi sinalizado
 servidor iniciado
 servidor está iniciando
 servidor está parado
 iniciando servidor mesmo assim
 esperando o servidor desligar... esperando o servidor iniciar... 