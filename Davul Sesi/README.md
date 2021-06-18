# Davul Sesi

Scaffold body: kısmına bir StatelessWidget bağlandı.
Bu sınıfın içerisinde en başta AudioCache sınıfından bir obje oluşturuldu.

final oynatici = AudioCache();

  void sesiCal(String ses) {
    oynatici.play('$ses.wav');
  }
  
Row'un içerisinde Expanded içerisinde Butonlar çağrıldı ve butonu en aşağıda ayrı bir fonksiyon olarak tanımlandı. Daha sonra normal yukarıda işlemler yapıldı.
