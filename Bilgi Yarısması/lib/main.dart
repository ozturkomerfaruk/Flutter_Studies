import 'package:bilgi_yarismasi/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Soru.dart';
import 'TestVeri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> yanitlar = [];
  TestVeri test1 = TestVeri();

  void IconEklemeCevap(bool cevap) {
    if (test1.getSoruIndex() + 1 < test1.getSoruSayisi()) {
      test1.getVerilenYanit() == cevap
          ? yanitlar.add(dogruYanitIconu)
          : yanitlar.add(yanlisYanitIconu);
      test1.SonrakiSoru();
    }
  }

  void ButonFonksiyonu(bool cevap) {
    if (test1.TestBittiMi()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Bravo Testi Bitirdin!"),
            actions: [
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    test1.TestBittiktenSonra();
                    yanitlar = [];
                  });
                },
                child: new Text("Başa Dön"),
              ),
              new FlatButton(
                onPressed: () {
                  setState(() {
                    SystemNavigator.pop();
                  });
                },
                child: new Text("Oyundan Çık"),
              ),
            ],
          );
        },
      );
    }
    setState(
      () {
        IconEklemeCevap(cevap);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: yanitlar,
          runSpacing: 3,
          spacing: 3,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        ButonFonksiyonu(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.green[400],
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        setState(
                          () {
                            ButonFonksiyonu(true);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
