��    �      <  �   \      (  R   )     |  
   �     �  -   �  �   �  �   n      A     5   X  J   �     �  6   �  P   ,  C   }  :   �  ]   �  4   Z  B   �  H   �  G     >   c  9   �  3   �  ?     /   P  -   �  E   �  y   �  (   n  #   �  7   �  (   �  ,     3   I  '   }  3   �  D   �  (     8   G  -   �  -   �  /   �  "     6   /  +   f     �  0   �  ;   �  $     /   ;     k  $   �  ~   �  1   -     _  /   }  J   �  �   �     �  C   �  -     8   E  !   ~  ,   �  /   �  4   �  A   2  @   t  ,   �  P   �  I   3  b   }     �     �  �     [   �     �     	     '  ;   ?  9   {  �   �  >   F  ;   �    �  u   �   q   H!  f   �!  s   !"  &   �"     �"     �"  &   �"  0   �"  .   +#  )   Z#  )   �#  "   �#  #   �#  "   �#      $  (   9$  "   b$     �$  "   �$  !   �$  ,   �$  $   %  *   7%  %   b%  !   �%     �%     �%     �%      �%     &     8&  -   S&  0   �&     �&     �&     �&  )   '     +'     /'  &   >'  %   e'     �'  +   �'  !   �'  �  �'  Q   �)  "   "*     E*     T*  C   j*  �   �*  �   O+    ,,  F   <-  4   �-  I   �-     .  D    .  [   e.  ]   �.  Q   /  f   q/  F   �/  I   0  >   i0  3   �0  C   �0  <    1  7   ]1  <   �1  5   �1  1   2  A   :2  �   |2  $   3  (   D3  >   m3  ,   �3  .   �3  5   4  0   >4  6   o4  G   �4  .   �4  9   5  3   W5  4   �5  ,   �5  %   �5  @   6  )   T6  #   ~6  A   �6  L   �6  #   17  .   U7      �7  '   �7  }   �7  7   K8     �8  =   �8  [   �8  �   <9     :  <   $:  /   a:  ;   �:     �:  *   �:  9   ;  6   R;  K   �;  6   �;  +   <  [   8<  L   �<  �   �<     l=  #   ~=  �   �=  h   T>     �>  7   �>     ?  6   *?  3   a?  �   �?  >   -@  D   l@  \  �@  �   B  �   �B  �   4C  s   �C  A   8D     zD     �D  :   �D  ;   �D  =   E  9   PE  9   �E  (   �E  (   �E  /   F  '   FF  #   nF  #   �F  '   �F  #   �F      G  '   #G  #   KG  (   oG      �G  ,   �G     �G     H     %H  %   AH     gH  #   �H  6   �H  -   �H  #   I     4I     SI  4   qI     �I     �I  -   �I  3   �I      J  0   9J  (   jJ            X       m   C   U   e              q   Q   "       ^   ;   k       E   @   {   *       i          _           v          |   d      >   A   u      ?   +   o      t      h       J   �   c   [   Y   n   ]   1   a   P   W       b   D       j   �   !                         N           #   B   H      2   %   3   <          R   S   )   =   l   .             :              6      �   	   M              /       �   g      O              f               '       K   p      �      -   `   5   $   F   8              9   y   L   w   \       &       0       s             z   r       Z          
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
 selecting default max_connections ...  selecting default shared_buffers ...  setting password ...  setting privileges on built-in objects ...  vacuuming database template1 ...  Project-Id-Version: initdb-tr
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2009-04-29 07:09+0000
PO-Revision-Date: 2009-04-29 16:27+0200
Last-Translator: Devrim GÜNDÜZ <devrim@commandprompt.com>
Language-Team: Turkish <ceviri@postgresql.org.tr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: KBabel 1.9.1
X-Poedit-Language: Turkish
X-Poedit-Country: TURKEY
X-Poedit-Basepath: ../postgresql-8.0.3/src
 
Eğer veri dizini belirtilmezse, PGDATA çevresel değişkeni kullanılacaktır
 
Daha az kullanılan seçenekler:
 
Seçenekler:
 
Diğer seçenekler:
 
Hataları <pgsql-bugs@postgresql.org> adresine bildirebilirsiniz.
 
İşlem başarılı. Veritabanı sunucusunu:

    %s%s%spostgres%s -D %s%s%s
ile ya da 
    %s%s%spg_ctl%s -D %s%s%s -l logfile start
ile başlatabilirsiniz.

 
UYARI: Yerel bağlantıları için "trust" yetkilendirmesi etkinleştiriliyor.
Bunu, pg_hba.conf dosyasını düzenleyerek ya da  initdb'yi yeniden 
 çalıştırdığınızda -A parametresi ile değiştirebilirsiniz..
       --lc-collate=, --lc-ctype=, --lc-messages=LOCALE
      --lc-monetary=, --lc-numeric=, --lc-time=LOCALE
                            yeni veritabanları için ilgili kategorideki öntanımlı yerel bilgisini
                            çevrede değişkenlerinden al
       --locale=LOCALE       yeni veritabanı için öntanımlı yerel
       --no-locale           --locale=C'ye eşdeğer
       --pwfile=DOSYA         yeni superuser için parolayı dosyadan oku
   %s [SEÇENEK]... [DATADIR]
   -?, --help                bu yardımı gösterir ve sonra çıkar
   -A, --auth=METHOD         yerel bağlantılar için ön tanımlı yetkilendirme yöntemi
   -E, --encoding=ENCODING   yeni veritabanları için öntanımlı dil kodlamasını ayarlar
   -L DIRECTORY              girdi dosyalarının nerede bulunacağını belirtir
   -T, --text-search-config=CFG
                            öntanımlı metin arama yapılandırması
   -U, --username=NAME       veritabanı superuser kullanıcısı adı
   -V, --version             sürüm bilgisini gösterir ve sonra çıkar
   -W, --pwprompt            yeni superuser için şifre sorar
   -X, --xlogdir=XLOGDIR     transaction log dizini
   -d, --debug               bol miktarda debug çıktısı üretir
   -n, --noclean             hatalardan sonra temizlik yapma
   -s, --show                dahili ayarları gösterir
 [-D, --pgdata=]DATADIR     bu veritabanı kümesi için yer
 %sbir PostgreSQL Veritabanı kümesini ilklendirir.

 %s: "%s" geçerli bir dil kodlaması adı değil
 %s: Şifre dosyası üretilemedi. Lütfen bu hatayı bildiriniz.
 %s: root olarak çalıştırılamaz.
(Örneğin "su" kullanarak ) sunucu sürecinin sahibi olacak şekilde sisteme yetkisiz bir kullanıcı olarak giriş yapın.
 %s: "%s" dizine erişim hatası: %s
 %s: "%s" dosyasına erişim hatası: %s
 %s: "%s" dizininin erişim haklarını değiştirilemiyor: %s
 %s: "%s" dizini oluşturma başarısız: %s
 %s: symbolic link "%s" oluşturma hatası: %s
 %s: geçerli bir kısa sürüm katarı belirlenemedi
 %s: "%s" komutu yürütme başlatma hatası: %s
 %s: %s yereli için uygun dil kodlaması bulunamadı.
 %s: "%s" yereli için uygun metin arama yapılandırması bulunamadı.
 %s: geçerli kullanıcı adı alınamadı: %s
 %s: geçerli kullanıcı hakkında bilgi alınamadı: %s
 %s: "%s"  dosyası, okunmak için açılamadı: %s
 %s: "%s" dosyası, yazılmak için açılamadı: %s
 %s: "%s" dosyasından şifre okunamadı: %s
 %s: "%s" dosyasına yazılamadı: %s
 %s: "%s" veri dizini kullanıcının isteği üzerine silinmedi
 %s:  "%s" dizini mevcut, ama boş değil
 %s: dil kodlaması uyuşmazlığı
 %s: veri dizininin içindekilerinin silme işlemini başarısız
 %s: transaction log dizininin içindekilerinin silme işlemini başarısız
 %s: veri dizini silme başarısız
 %s: transaction log dizini silme başarısız
 %s: "%s" dosyası mevcut değil
 %s: "%s" düzgün bir dosya değildir.
 %s: "%s" girdi dosyası PostgreSQL'e ait değil %s
Kurulumunuzu kontrol edin ya da -L seçeneği ile doğru dizini belirtin.
 %s: girdi dosyasının yeri mutlak bir yol olmalıdır
 %s: geçersiz yerel adı "%s"
 %s: %s yereli desteklenmeyen %s dil kodlamasını gerektirir
 %s: %s yetkilendirmesini etkinleştirmek için superuser'a şifre atamanız gerekmektedir.
 %s: Hiçbir veri dizini belirtilmedi
Bu veritabanı sistemi için verinin hangi dizinde duracağını belirtmeniz gerekmektedir.
Bunu ya -D seçeneği ile ya da PGDATA çevresel değişkeni ile yapabilirsiniz.
 %s: yetersiz bellek
 %s: şifre promptu ve şifre dosyası birlikte belirtilemez
 %s: veri dizininin içindekiler siliniyor "%s"
 %s: transaction log dizininin içindekileri siliniyor "%s"
 %s: veri dizini siliniyor "%s"
 %s: transaction log dizini siliniyor "%s"
 %s: bu platformda sembolik bağlantı desteklenmemektedir %s: Çok fazla komut satırı girdisi var (ilki "%s")
 %s: "%s" transaction log dizini kullanıcının isteği üzerine silinmedi
 %s: transaction log dizini mutlak bir yol olmalıdır
 %s: bilinmeyen yetkilendirme yöntemi"%s".
 %s: uyarı: belirtilen metin arama yapılandırması  "%s", %s yereli ile eşleşmeyebilir
 %s: uyarı: %s yereli için uygun metin arama yapılandırması bilinmiyor.
 %s dil kodlaması sunucu tarafında izin verilen bir dil kodlaması değildir
 %s'i değişik bir dil seçimi ile tekrar çalıştırın.
 Yeniden giriniz:  Yeni superuser şifresini giriniz:  Yeni bir veritabanı sistemi yaratmak istiyorsanız, ya "%s" dizinini 
kaldırın, ya boşaltın ya da ya da %s 'i 
"%s" argümanından başka bir argüman ile çalıştırın.
 Eğer transaction kayıt dosyasını saklamak istiyorsanız, 
"%s" dizinini kaldırın ya da boşaltın
 Şifreler uyuşmadı.
 %s komutunu -E seçeneği ile yeniden çalıştırın.
 Debug modunda çalışıyor.
 noclean modunda çalışıyor.  Hatalar silinmeyecek.
 Veritabanı kümesi %s yereli ile ilklendirilecek.
 Veritabanı kümesi aşağıdaki yerellerle ilklendirilecek:
  COLLATE:  %s
  CTYPE:    %s
  MESSAGES: %s
  MONETARY: %s
  NUMERIC:  %s
  TIME:     %s
 Öntanımlı veritabanı dil kodlaması %s olarak ayarlandı.
 Öntanımlı metin arama yapılandırması "%s" olarak ayarlanacak.
 Seçtiğiniz (%s) dil kodlaması ve seçilen yerelin kullandığı dil 
kodlaması (%s) uyuşmamaktadır.  Bu durum, çeşitli metin işleme 
 fonksiyonlarının yanlış çalışmasına neden olabilir. Bu durumu 
 düzeltebilmek için %s komutunu yeniden çalıştırın ve de ya kodlama 
 belirtmeyin ya da eşleştirilebilir bir kodlama seçin.
 Bu veritabanı sistemine ait olan dosyaların sahibi "%s" kullanıcısı olacaktır.
Bu kullanıcı aynı zamanda sunucu sürecinin de sahibi olmalıdır.

  "postgres"  programına %s gereksinim duymaktadır, ancak bu program  "%s"
ile aynı dizinde bulunamadı.
Kurulumunuzu kontrol ediniz.
  "postgres"  programı "%s" tarafından bulundu; ancak bu program  %s
ile aynı sürüm numarasına sahip değil.
Kurulumunuzu kontrol ediniz.
 Bu durum, bozulmus bir kurulumunuz olduğu ya da
-L parametresi ile yanlış dizin belirttiğiniz anlamına gelir.
 Ayrıntılı bilgi için  "%s --help" komutunu deneyebilirsiniz.
 Kullanımı:
 sinyal yakalandı
 alt süreç %d çıkış koduyla sonuçlandırılmıştır alt süreç %d bilinmeyen durumu ile sonlandırılmıştır alt süreç 0x%X exception tarafından sonlandırılmıştır alt süreç %d sinyali tarafından sonlandırılmıştır alt süreç %s sinyali tarafından sonlandırılmıştır template1, postgres'e kopyalanıyor ...  template1 template0'a kopyalanıyor ...  çalışma dizini "%s" olarak değiştirilemedi "%s"  çalıştırmak için bulunamadı geçerli dizin tespit edilemedi: %s "%s" dizini açma başarısız: %s
 "%s" ikili (binary) dosyası okunamadı "%s" dizini okuma başarısız: %s
 symbolic link "%s" okuma hatası "%s" dizini kaldırma başarısız: %s
 "%s" junction ayarlama hatası: %s
 "%s" dosya ya da dizini bulunamadı: %s
 çocuk sürece yazılamadı: %s
 yapılandırma dosyaları yaratılıyor ...  dönüşümler yükleniyor ...  sözlükler oluşturuluyor...  %s dizini yaratılıyor...  information schema yaratılıyor ...  alt dizinler oluşturuluyor...  sistem viewları yaratılıyor ...  %s/base/1 içinde template1 veritabanı yaratılıyor. mevcut %s dizininin izinleri düzeltiliyor... bağlılıklar ilklendiriliyor ...  pg_authid ilklendiriliyor ...  geçersiz ikili (binary) "%s" sistem nesnelerinin açıklamaları yükleniyor ...  tamam
 bellek yetersiz
 ön tanımlı max_connections seçiliyor ...  öntanımlı shared_buffers değeri seçiliyor ...  şifre ayarlanıyor ...  gömülü nesnelerdeki izinler ayarlanıyor ...  template1 veritabanı vakumlanıyor ...  