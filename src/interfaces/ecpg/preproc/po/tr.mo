��    v      �  �   |      �	  ~   �	  -   p
  +   �
  0   �
  7   �
  g   3     �  4   �  s   �  .   d  G   �  4   �  )     w   :  4   �     �  @   �  =   ;  !   y     �  ,   �  1   �  *     -   C  -   q  1   �  '   �  &   �  +      "   L      o     �  #   �     �  )   �  =     '   B  '   j  	   �     �  &   �  <   �  !     	   >  -   H  9   v  +   �  "   �     �  ,        G     f  *   �  "   �  '   �     �       !   *     L  !   e     �      �  3   �  /   �  '   !  ,   I  /   v  *   �  T   �  '   &     N     i     �     �     �  -   �  ,   �  ,   #  5   P     �  )   �  ?   �  8     �   E  0   �  5        C  A   X  L   �     �  6   �  '   ,  #   T     x  (   �  4   �  )   �          *      C  $   d     �  "   �  ,   �     �     	  '   )     Q     p  $   �  0   �     �  8         9     W  &   u      �  �  �  �   t  C      /   X   3   �   3   �   {   �   $   l!  D   �!  s   �!  H   J"  Y   �"  >   �"  4   ,#  �   a#  K   $     M$  G   b$  =   �$  #   �$      %  6   -%  >   d%  7   �%  :   �%  :   &  >   Q&  4   �&  3   �&  8   �&  !   2'  #   T'      x'  -   �'     �'  1   �'  F   �'  (   F(  (   o(     �(     �(  *   �(  f   �(  *   S)     ~)  /   �)  _   �)  0   *  (   F*     o*  ,   �*      �*  $   �*  2   �*  '   /+  -   W+     �+      �+  '   �+     �+  '   ,     ,,  2   8,  8   k,  ,   �,  7   �,  8   	-  :   B-  1   }-  _   �-  *   .     :.     W.     u.     �.     �.  .   �.  (   �.  -   /  7   D/     |/  #   �/  B   �/  7   �/  N   60  9   �0  ?   �0     �0  H   1  X   a1     �1  A   �1  -   2  2   :2     m2  -   �2  =   �2  .   �2     3     ;3  "   V3  +   y3     �3  "   �3  2   �3  "   4  *   74  2   b4  ?   �4  ?   �4  .   5  -   D5  #   r5  7   �5      �5     �5  .   6  /   >6         ?   q       ;   R   ,   X          N      ^              f   b   7       9          $   g          	                    
   l              v                  d   c   =   !       k   _   j   t   3   8      O   a   i      `   \      A                 e   1   W   m   .      ]               u          P   )   M   0   I   H   h      K   G          #   %   o   Y          S   <   -   [       Z   4       (           D               L   '      r   J       *             5   &       :   F   >   C   n   V   6       U   T   Q   /       +   B       p   @   "   E                    2             s    
If no output file is specified, the name is formed by adding .c to the
input file name, after stripping off .pgc if present.
 
Report bugs to <pgsql-bugs@postgresql.org>.
   --help         show this help, then exit
   --regression   run in regression testing mode
   --version      output version information, then exit
   -C MODE        set compatibility mode; MODE can be one of
                 "INFORMIX", "INFORMIX_SE"
   -D SYMBOL      define SYMBOL
   -I DIRECTORY   search DIRECTORY for include files
   -c             automatically generate C code from embedded SQL code;
                 this affects EXEC SQL TYPE
   -d             generate parser debug output
   -h             parse a header file, this option includes option "-c"
   -i             parse system include files as well
   -o OUTFILE     write result to OUTFILE
   -r OPTION      specify run-time behavior; OPTION can be:
                 "no_indicator", "prepare", "questionmarks"
   -t             turn on autocommit of transactions
 %s at or near "%s" %s is the PostgreSQL embedded SQL preprocessor for C programs.

 %s, the PostgreSQL embedded C preprocessor, version %d.%d.%d
 %s: could not open file "%s": %s
 %s: no input files specified
 %s: parser debug support (-d) not available
 AT option not allowed in CLOSE DATABASE statement AT option not allowed in CONNECT statement AT option not allowed in DEALLOCATE statement AT option not allowed in DISCONNECT statement AT option not allowed in SET CONNECTION statement AT option not allowed in TYPE statement AT option not allowed in VAR statement AT option not allowed in WHENEVER statement COPY FROM STDIN is not implemented COPY FROM STDOUT is not possible COPY TO STDIN is not possible CREATE TABLE AS cannot specify INTO ERROR:  EXEC SQL INCLUDE ... search starts here:
 Error: include path "%s/%s" is too long on line %d, skipping
 NEW used in query that is not in a rule OLD used in query that is not in a rule Options:
 SHOW ALL is not implemented Try "%s --help" for more information.
 Unix-domain sockets only work on "localhost" but not on "%s" Usage:
  %s [OPTION]... FILE...

 WARNING:  arrays of indicators are not allowed on input constraint declared INITIALLY DEFERRED must be DEFERRABLE could not open include file "%s" on line %d could not remove output file "%s"
 cursor "%s" does not exist cursor "%s" has been declared but not opened cursor "%s" is already defined descriptor "%s" does not exist descriptor header item "%d" does not exist descriptor item "%s" cannot be set descriptor item "%s" is not implemented end of search list
 expected "://", found "%s" expected "@" or "://", found "%s" expected "@", found "%s" expected "postgresql", found "%s" incomplete statement incorrectly formed variable "%s" indicator for array/pointer has to be array/pointer indicator for simple data type has to be simple indicator for struct has to be a struct indicator variable must have an integer type initializer not allowed in EXEC SQL VAR command initializer not allowed in type definition internal error: unreachable state; please report this to <pgsql-bugs@postgresql.org> interval specification not allowed here invalid bit string literal invalid connection type: %s invalid data type key_member is always 0 missing "EXEC SQL ENDIF;" missing identifier in EXEC SQL DEFINE command missing identifier in EXEC SQL IFDEF command missing identifier in EXEC SQL UNDEF command missing matching "EXEC SQL IFDEF" / "EXEC SQL IFNDEF" more than one EXEC SQL ELSE multidimensional arrays are not supported multidimensional arrays for simple data types are not supported multidimensional arrays for structures are not supported multilevel pointers (more than 2 levels) are not supported; found %d level multilevel pointers (more than 2 levels) are not supported; found %d levels nested arrays are not supported (except strings) no longer supported LIMIT #,# syntax passed to server nullable is always 1 only data types numeric and decimal have precision/scale argument only protocols "tcp" and "unix" and database type "postgresql" are supported out of memory pointer to pointer is not supported for this data type pointers to varchar are not implemented subquery in FROM must have an alias syntax error syntax error in EXEC SQL INCLUDE command too many levels in nested structure/union definition too many nested EXEC SQL IFDEF conditions type "%s" is already defined unmatched EXEC SQL ENDIF unrecognized data type name "%s" unrecognized descriptor item code %d unrecognized token "%s" unrecognized variable type code %d unsupported feature will be passed to server unterminated /* comment unterminated bit string literal unterminated hexadecimal string literal unterminated quoted identifier unterminated quoted string using unsupported DESCRIBE statement variable "%s" is neither a structure nor a union variable "%s" is not a pointer variable "%s" is not a pointer to a structure or a union variable "%s" is not an array variable "%s" is not declared variable "%s" must have a numeric type zero-length delimited identifier Project-Id-Version: PostgreSQL 8.4
Report-Msgid-Bugs-To: pgsql-bugs@postgresql.org
POT-Creation-Date: 2009-06-11 05:16+0000
PO-Revision-Date: 2009-06-29 00:51+0200
Last-Translator: Devrim GÜNDÜZ <devrim@gunduz.org>
Language-Team: Turkish <devrim@gunduz.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
X-Poedit-Language: Turkish
X-Poedit-Country: TURKEY
 
Eğer çıktı dosyası belirtilmediyse, dosyanın adı eğer sonunda .pgc varsa
kaldırıldıktan sonra girdi dosyasının sonuna .c eklenerek oluşturulur.
 
Hataları <pgsql-bugs@postgresql.org> adresine bildirebilirsiniz.
   --help         bu yardımı göster ve çık
   --regression   regression testi modunda çalış
   --version      sürüm numarasını yaz ve çık
   -C MOD        uyumluluk modunu ayarla; MOD aşağıdakilerden birisi olabilir
                 "INFORMIX", "INFORMIX_SE"
   -D SEMBOL       SEMBOLü tanımla
   -I DİZİN   dosyaları içermek için DİZİN dizinini araştır
   -c             gömülü SQL kodundan otomatik olarak C kodu üret;
                 bu EXEC SQL TYPE'ı etkiler
   -d            ayrıştırıcı hata ayıklama çıktısını oluştur
   -h             başlık dosyasını ayrıştır; bu seçenek "-c" seçeneğini içerir
   -i             sistem include dosyalarını da ayrıştırl
   -o ÇIKTI DOSYASI     sonucu ÇIKTI DOSYASIna yaz
   -r SEÇENEK      çalışma zamanı davranışını belirt; SEÇENEK şunlardan birisi olabilir:
                 "no_indicator", "prepare", "questionmarks"
   -t            transactionların otomatik commit olması özelliğini aç
 "%2$s"  yerinde %1$s %s C programları için PostgreSQL'e gömüşü SQL önişlemcisidir.

 %s, PostgreSQL gömülü C önişlemcisi, %d.%d.%d sürümü
 %s: "%s" dosyası açılamadı: %s
 %s: girdi dosyası belirtilmedi
 %s: ayrıştırıcı hata ayıklama desteği (-d) yok
 AT seçeneğine CLOSE DATABASE ifadesinde izin verilmemektedir AT seçeneğine CONNECT ifadesinde izin verilmemektedir AT seçeneğine DEALLOCATE ifadesinde izin verilmemektedir AT seçeneğine DISCONNECT ifadesinde izin verilmemektedir AT seçeneğine SET CONNECTION ifadesinde izin verilmemektedir AT seçeneğine TYPE ifadesinde izin verilmemektedir AT seçeneğine VAR ifadesinde izin verilmemektedir AT seçeneğine WHENEVER ifadesinde izin verilmemektedir COPY FROM STDIN kodlanmamıştır COPY FROM STDOUT mümkün değildir COPY TO STDIN mümkün değildir CREATE TABLE AS işleminde INTO kullanılamaz HATA: EXEC SQL INCLUDE ... araması burada başlıyor:
 Hata: "%s/%s" include yolu çok uzun, satır numarası %d; atlanıyor
 rule olmayan sorgusunda NEW kullanıldı rule olmayan sorgusunda OLD kullanıldı Seçenekler:
 SHOW ALL kodlanmamıştır Daha fazla bilgi için "%s --help" yazın
 Unix-domain soketleri sadece "localhost" üzerinde çalışabilir; ancak  "%s" üzerinde çalışamaz. Kullanımı:
  %s [SEÇENEK]... DOSYA...

 UYARI: belirticilerin dizilerine girdide izin verilmez INITIALLY DEFERRED olarak tanımlanan kısıtlayıcı DEFERRABLE özelliğine sahip olmalıdır  "%s" include dosyası %d. satırda açılamadı "%s" çıktı dosyası kaldırılamadı
 "%s" imleci mevcut değil "%s" imleci tanımlanmış ama açılmamış "%s" imleci zaten tanımlanmış "%s" açıklayıcısı mevcut değil "%d" açıklayıcı başlık maddesi mevcut değil "%s" açıklayıcı öğesi ayarlanamaz "%s" açıklayıcı öğesi kodlanmamıştır arama listesinin sonu
 "://" bekleniyordu; "%s" bulundu "@" or "://" bekleniyordu; "%s" bulundu "@" bekleniyordu; "%s" bulundu "postgresql" bekleniyordu; "%s" bulundu eksik ifade doğru şekilde oluşturulmamış "%s" değişkeni array/pointer için gösterici array/pointer olmalıdır basit veri tipinin göstergesi basit olmalı struct için gösterici (indicator) yine struct olmalı belirteç değişkeni tamsayı veri tipine sahip olmalı EXEC SQL VAR konutunda ilklendiriciye izin verilmemektedir tip tanımlamasında ilklendiriciye izin verilmez dahili hata: erişilemeyen durum: bunu lütfen <pgsql-bugs@postgresql.org> adresine bildiriniz. aralık belirtimine burada izin verilmiyor geçersiz bit dizini bilgisi Geçersiz bağlantı tipi: %s geçersiz veri tipi key_member her zaman 0'dır. eksik "EXEC SQL ENDIF;" EXEC SQL DEFINE komutunda eksik tanımlayıcı EXEC SQL IFDEF komutunda eksik belirteç EXEC SQL UNDEF komutunda eksik tanımlayıcı eksik  "EXEC SQL IFDEF" / "EXEC SQL IFNDEF" eşleşmesi birden fazla EXEC SQL ELSE çok boyutlu diziler desteklenmiyor basit veri tipleri için çok boyutlu diziler desteklenmemektedir. yapılar için çok boyutlu diziler desteklenmemektedir çoklu seviye işaretçileri (İkiden fazla) desteklenmiyor: %d seviye bulundu içiçe geçmiş diziler, dizgiler haricinde desteklenmez artık desteklenmeyen LIMIT #,# sözdizimi sunucuya aktarıldı nullable her zaman 1'dir sadece sayısal ve ondalıklı verip tiplerinin ondalık bilgisi vardır sadece "tcp" ve "unix" protokolleri ile "postgresql" veritabanı tipi desteklenmektedir. yetersiz bellek Bu veri tipi için işaretçiden işaretçiye desteklenmemektedir varcharlara işaretçiler henüz uyarlanmadı FROM öğesindeki subquery bir aliası almalıdır söz dizim hatası  EXEC SQL INCLUDE komutunda sözdizimi hatası içiçe gelmiş yapı/birleşme tanımında çok fazla seviye Çok fazla yuvalanmış EXEC SQL IFDEF koşulu "%s" tipi zaten tanımlanmış eşlenmeyen EXEC SQL ENDIF tanımlanmayan veri tipi adı "%s" tanımlanmayan açıklayıcı madde kodu %d tanımlanmayan imge "%s" tanımsız değişken tipi kodu %d desteklenmeyen  özellik sunucuya aktarılacaktır /* açıklama sonlandırılmamış sonuçlandırılmamış bit string literal sonuçlandırılmamış hexadecimal string literal sonuçlandırılmamış tırnakla sınırlandırılmış tanım sonuçlandırılmamış tırnakla sınırlandırılmış satır desteklenmeyen DESCRIBE ifadesi kullanılıyor "%s" değişkeni structure ya da union değil "%s" değişkeni bir pointer değil "%s" değişkeni structure ya da union'a pointer değil "%s" değişkeni bir dizi değil "%s" değişkeni bildirilmemiş "%s" değişkeninin sayısal veri tipi olmalı sınırlandırılmış tanım sıfır uzunluklu 