import 'package:flutter/material.dart';
import 'package:muze/utils/colors.dart';

class MyAppTheme {
  static ThemeData light = ThemeData(
    fontFamily: 'Nunito',
    primaryColor: MyColors.primary,
    accentColor: MyColors.secondary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: MyColors.white,
    splashColor: MyColors.splashLight,
    appBarTheme: AppBarTheme(
      color: MyColors.white,
      centerTitle: true,
      elevation: 0.0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
