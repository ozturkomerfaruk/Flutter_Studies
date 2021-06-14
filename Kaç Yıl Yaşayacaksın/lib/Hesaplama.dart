import 'package:yasam_beklentisi/user_data.dart';

class Hesaplama{
  UserData _userData;
  Hesaplama(this._userData);

  double HesaplamaIslemi(){
    double sonuc = 0.0;
    sonuc = 90 + _userData.yapilanSpor - _userData.icilenSigara;
    sonuc += (_userData.boy/_userData.kilo);

    return _userData.seciliCinsiyet == "KADIN" ? sonuc + 3 : sonuc;
  }
}