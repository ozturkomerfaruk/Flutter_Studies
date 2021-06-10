import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(
    BenimUygulamam(),
  );
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Bugün Ne Yesem?",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: YemekSayfasi(),
      ),
    );
  }
}

class YemekSayfasi extends StatefulWidget {
  @override
  _YemekSayfasiState createState() => _YemekSayfasiState();
}

class _YemekSayfasiState extends State<YemekSayfasi> {
  int corbaNo = 1;
  int yemekNo = 1;
  int tatliNo = 1;

  List<String> CorbaAdlari = [
    'Mercimek Çorbası',
    'Tarhana Çorbası',
    'Tavuk Suyu Çorbası',
    'Düğün Çorbası',
    'Yoğurt Çorbası'
  ];

  List<String> YemekAdlari = [
    'Karnıyarık',
    'Mantı',
    'Kuru Fasulye',
    'İçli Köfte',
    'Izgara Balık'
  ];

  List<String> TatliAdlari = [
    'Kadayıf',
    'Baklava',
    'Sütlaç',
    'Kazandibi',
    'Dondurma'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      corbaNo = Random().nextInt(5) + 1;
                    });
                  },
                  child: Image.asset("assets/images/corba_$corbaNo.jpg")),
            ),
          ),
          Text(
            CorbaAdlari[corbaNo - 1],
            style: GoogleFonts.abrilFatface(
              fontSize: 20,
            ),
          ),
          Container(
            width: 250,
            child: Divider(
              thickness: 1,
              color: Colors.black26,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    yemekNo = Random().nextInt(5) + 1;
                  });
                },
                child: Image.asset("assets/images/yemek_$yemekNo.jpg"),
              ),
            ),
          ),
          Text(
            YemekAdlari[yemekNo - 1],
            style: GoogleFonts.abrilFatface(
              fontSize: 20,
            ),
          ),
          Container(
            width: 250,
            child: Divider(
              thickness: 1,
              color: Colors.black26,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    tatliNo = Random().nextInt(5) + 1;
                  });
                },
                child: Image.asset("assets/images/tatli_$tatliNo.jpg"),
              ),
            ),
          ),
          Text(
            TatliAdlari[tatliNo - 1],
            style: GoogleFonts.abrilFatface(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
