import 'package:flutter/material.dart';
import 'package:muze/utils/colors.dart';

// ignore: avoid_classes_with_only_static_members
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
