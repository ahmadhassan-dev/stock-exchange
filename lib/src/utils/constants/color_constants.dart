// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ColorConstants {
  ColorConstants._private();

  static final ColorConstants _colorConstants = ColorConstants._private();

  factory ColorConstants() {
    return _colorConstants;
  }

  Color BLACK_COLOR = Colors.black;
  Color GREY_COLOR = Colors.grey;
  Color WHITE_COLOR = Colors.white;
  Color ORANGE_COLOR = Colors.orange;
  Color GREEN_COLOR = Colors.green;
  Color K_SCREEN_BLACK_COLOR = const Color(0XFF1C1E24);
  Color K_CARD_BLACK_COLOR = const Color(0X0f313138);
  Color K_PRIMARY_COLOR = const Color(0XFFFF7D1F);
  Color K_BLUE_COLOR = const Color(0XFFADF1FB);
  Color K_GREEN_BLACK_COLOR = const Color(0XFFBFEAB9);
  Color K_PINK_BLACK_COLOR = const Color(0XFFF4C1DF);
}
