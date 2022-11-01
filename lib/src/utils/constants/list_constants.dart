// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'color_constants.dart';

class ListConstants {
  ListConstants._private();

  static final ListConstants _listConstants = ListConstants._private();

  factory ListConstants() {
    return _listConstants;
  }

  List<Color> COLORS_ARRAY = [
    ColorConstants().K_PRIMARY_COLOR,
    ColorConstants().K_GREEN_BLACK_COLOR,
    ColorConstants().K_BLUE_COLOR,
    ColorConstants().K_PINK_BLACK_COLOR,
  ];
}
