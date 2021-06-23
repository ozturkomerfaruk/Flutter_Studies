import 'package:flutter/material.dart';

class GifCard extends StatelessWidget {
  final String gifUrl;
  GifCard(this.gifUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        fit: BoxFit.cover,
        image: NetworkImage(gifUrl),
      ),
    );
  }
}