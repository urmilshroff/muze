import 'package:flutter/material.dart';
import 'package:muze/utils/colors.dart';

class MyTextStyles {
  static const title = TextStyle(
    color: MyColors.black,
    fontSize: 36.0,
    fontFamily: 'LexendDeca',
  );

  static const heading = TextStyle(
    color: MyColors.black,
    fontSize: 28.0,
    fontFamily: 'LexendDeca',
  );

  static const body1 = TextStyle(
    color: MyColors.black,
    fontSize: 18.0,
    fontFamily: 'Nunito',
  );

  static const body2 = TextStyle(
    color: MyColors.black,
    fontSize: 16.0,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.bold,
  );

  static const body3 = TextStyle(
    color: MyColors.black,
    fontSize: 14.0,
    fontFamily: 'Nunito',
  );

  static const button = TextStyle(
    color: MyColors.primary,
    fontSize: 16.0,
    fontFamily: 'LexendDeca',
  );
}
