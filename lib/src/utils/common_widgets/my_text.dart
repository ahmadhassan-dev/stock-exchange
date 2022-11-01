import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyText extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const MyText(
    this.title, {
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 12,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}
