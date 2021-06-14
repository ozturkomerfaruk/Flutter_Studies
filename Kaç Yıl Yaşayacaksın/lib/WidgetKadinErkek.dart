import 'package:flutter/material.dart';

class WidgetKadinErkek extends StatelessWidget {
  final IconData icon;
  final String cinsiyet;
  WidgetKadinErkek({this.icon, this.cinsiyet});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          cinsiyet,
          style: TextStyle(
            fontSize: 40,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
