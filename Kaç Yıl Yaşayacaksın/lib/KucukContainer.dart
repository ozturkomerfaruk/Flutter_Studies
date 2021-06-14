import 'package:flutter/material.dart';

class KucukContainer extends StatelessWidget {
  final Color renk;
  final Widget child;
  final Function onPress;
  KucukContainer({this.renk = Colors.white, this.child, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: renk,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
