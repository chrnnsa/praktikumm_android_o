import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  ReusableWidget({required this.color, this.cardChild});

  final Color color;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: color, //Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10.0)),
      height: 200.0,
      width: 179.0,
    );
  }
}
