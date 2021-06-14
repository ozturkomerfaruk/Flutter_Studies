import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/user_data.dart';
import 'package:yasam_beklentisi/Hesaplama.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  ResultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                Hesaplama(_userData).HesaplamaIslemi().round().toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Geri Dön",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
