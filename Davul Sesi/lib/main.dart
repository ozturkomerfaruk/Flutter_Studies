import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DrumMachine());
}

class DrumMachine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Davul Sesi'),
          backgroundColor: Colors.white70,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: DrumPage(),
      ),
    );
  }
}

class DrumPage extends StatelessWidget {
  final oynatici = AudioCache();

  void sesiCal(String ses) {
    oynatici.play('$ses.wav');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('bip', Colors.blueAccent, 'bip'),
                  ),
                  Expanded(
                    child: buildDrumPad('bongo', Colors.redAccent, 'bongo'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('clap1', Colors.purpleAccent, 'clap1'),
                  ),
                  Expanded(
                    child: buildDrumPad('clap2', Colors.blueGrey, 'clap2'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('clap3', Colors.orangeAccent, 'clap3'),
                  ),
                  Expanded(
                    child: buildDrumPad('crash', Colors.cyanAccent, 'crash'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('how', Colors.pinkAccent, 'how'),
                  ),
                  Expanded(
                    child: buildDrumPad('oobah', Colors.brown, 'oobah'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: buildDrumPad('ridebel', Colors.green, 'ridebel'),
                  ),
                  Expanded(
                    child: buildDrumPad('woo', Colors.white, 'woo'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton buildDrumPad(String ses, Color renk, String isim) {
    return TextButton(
      onPressed: () {
        sesiCal(ses);
      },
      child: Container(
        child: Text(
          isim,
          style: TextStyle(
            fontSize: 40,
            color: renk,
          ),
        ),
        //color: renk,
      ),
    );
  }
}
