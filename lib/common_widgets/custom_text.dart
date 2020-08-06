import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  CustomText(this.text, this.color, this.fontSize);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
      ),

    );
  }
}
