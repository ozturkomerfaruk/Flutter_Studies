# bilgi yarışması

Sfaffold body kısmına SafeArea tanımlandı. child kısmına ise SoruSayfası(),

SoruSayfası bir statefulWidget tır.

En başta içi boş bir list tutuldu. ve Testveri sınıfından bir obje oluşturuldu.

Test veri içerisinde 7 tane soru bulunmaktadır. Bu sorular private olarak oluşturulmuştur. Listeye uzaktan ulaşmak için listi get set etmek yerine, onun sorusunu, cevabını ayrı ayrı get set yapılmıştır.

Örneğin String getSoruMetni() => return _SoruBankasi[_soruIndex].sorulanSoru; şeklindedir.

getVerilenyanit(), getSoruSayisi(), getSoruIndex(), SonrakiSoru(), TestBittiMi(), TestBittiktenSonra() metotları oluşturulmuştur.

Daha sonra main.dart'a geri dönecek olursak, IconEkeleme yapabilmemiz için her bir doğru cevabın ardından bir metot eklenmiştir.

Bu Iconları ekleyebilmesi için constants.dart oluşturulmuştur.

Buton görevini yapabilmesi için ayrı bir bool parametreli metot oluşturulmuştur.

Testi bitirdikten sonra bir uyarı ekranı çıkarmıştır. Bu görevi yapan **AlertDialog** idir.

Daha sonra normal UI kısmı ayarlanmıştır.
