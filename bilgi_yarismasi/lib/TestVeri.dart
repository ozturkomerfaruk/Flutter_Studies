import 'Soru.dart';

class TestVeri {
  int _soruIndex = 0;

  List<Soru> _SoruBankasi = [
    Soru(
        sorulanSoru: '1.Titanic gelmiş geçmiş en büyük gemidir',
        verilenYanit: false),
    Soru(
        sorulanSoru: '2.Dünyadaki tavuk sayısı insan sayısından fazladır',
        verilenYanit: true),
    Soru(sorulanSoru: '3.Kelebeklerin ömrü bir gündür', verilenYanit: false),
    Soru(sorulanSoru: '4.Dünya düzdür', verilenYanit: false),
    Soru(
        sorulanSoru: '5.Kaju fıstığı aslında bir meyvenin sapıdır',
        verilenYanit: true),
    Soru(
        sorulanSoru: '6.Fatih Sultan Mehmet hiç patates yememiştir',
        verilenYanit: true),
    Soru(
        sorulanSoru: '7.Fransızlar 80 demek için, 4 - 20 der',
        verilenYanit: true),
  ];

  String getSoruMetni() {
    return _SoruBankasi[_soruIndex].sorulanSoru;
  }

  bool getVerilenYanit() {
    return _SoruBankasi[_soruIndex].verilenYanit;
  }

  int getSoruSayisi() {
    return _SoruBankasi.length;
  }

  int getSoruIndex() {
    return _soruIndex;
  }

  void SonrakiSoru() {
    if (_soruIndex + 1 < _SoruBankasi.length)
      _soruIndex++;
    else
      print("daha fazla soru yok karşim");
  }

  bool TestBittiMi() {
    if (_soruIndex + 1 >= _SoruBankasi.length)
      return true;
    else
      return false;
  }

  void TestBittiktenSonra() {
    _soruIndex = 0;
  }
}
