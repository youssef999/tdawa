import 'package:flutter/material.dart';

class Custom_Text extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final Color color;
  final Alignment alignment;
  final double height;

  const Custom_Text(
      {required this.text,
      this.fontSize = 16.0,
        this.textAlign=TextAlign.center,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.height = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        textAlign:textAlign,
        text ?? '',
        style: TextStyle(
            color: color,
            height: height,
            fontSize: fontSize,

            wordSpacing: 1.2,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
