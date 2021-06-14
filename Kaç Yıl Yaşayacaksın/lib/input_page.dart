import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/user_data.dart';
import 'KucukContainer.dart';
import 'WidgetKadinErkek.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = "";
  double icilenSigara = 0;
  double yapilanSpor = 0;
  double boy = 150;
  double kilo = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: KucukContainer(
                      child: buildRowOutlinedButton("BOY"),
                    ),
                  ),
                  Expanded(
                    child: KucukContainer(
                      child: buildRowOutlinedButton("KİLO"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: KucukContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haftada Kaç Kez Spor Yapıyorsunuz?",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      yapilanSpor.round().toString(),
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.lightBlue,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 7,
                      value: yapilanSpor,
                      onChanged: (double newValue) {
                        setState(() {
                          yapilanSpor = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: KucukContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Günde Kaç Kez Sigara İçiyorsunuz?",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      icilenSigara.round().toString(),
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.lightBlue,
                      ),
                    ),
                    Slider(
                      min: 0,
                      max: 30,
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: KucukContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "KADIN";
                        });
                      },
                      renk: seciliCinsiyet == "KADIN"
                          ? Colors.yellowAccent
                          : Colors.white,
                      child: WidgetKadinErkek(
                        icon: FontAwesomeIcons.venus,
                        cinsiyet: "KADIN",
                      ),
                    ),
                  ),
                  Expanded(
                    child: KucukContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "ERKEK";
                        });
                      },
                      renk: seciliCinsiyet == "ERKEK"
                          ? Colors.redAccent
                          : Colors.white,
                      child: WidgetKadinErkek(
                        icon: FontAwesomeIcons.mars,
                        cinsiyet: "ERKEK",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonTheme(
              height: 50,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          UserData(
                            seciliCinsiyet:seciliCinsiyet,
                            icilenSigara:icilenSigara,
                            yapilanSpor:yapilanSpor,
                            boy:boy,
                            kilo:kilo,
                          ),
                        ),
                      ));
                },
                color: Colors.white,
                child: Text(
                  "HESAPLA",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRowOutlinedButton(String boyKiloString) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            boyKiloString,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            boyKiloString == 'BOY'
                ? boy.round().toString()
                : kilo.round().toString(),
            style: TextStyle(
              fontSize: 35,
              color: Colors.lightBlue,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    boyKiloString == 'BOY' ? boy++ : kilo++;
                  });
                },
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    boyKiloString == 'BOY' ? boy-- : kilo--;
                    if (boy <= 0) boy = 0;
                    if (kilo <= 0) kilo = 0;
                  });
                },
                child: Text(
                  "-",
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
