import 'package:flutter/material.dart';
import 'package:muze/utils/colors.dart';

class MyAppTheme {
  static ThemeData light = ThemeData(
    fontFamily: 'Nunito',
    backgroundColor: MyColors.lightBG,
    primaryColor: MyColors.lightPrimary,
    accentColor: MyColors.lightAccent,
    scaffoldBackgroundColor: MyColors.lightBG,
    splashColor: MyColors.maze,
    errorColor: MyColors.badgeColor,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 28.0,
          fontFamily: 'LexendDeca',
          color: MyColors.maze,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static ThemeData dark = ThemeData(
    fontFamily: 'Nunito',
    primaryColor: MyColors.darkPrimary,
    accentColor: MyColors.darkAccent,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: MyColors.darkBG,
    splashColor: MyColors.maze,
    errorColor: MyColors.badgeColor,
    appBarTheme: AppBarTheme(
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 28.0,
          fontFamily: 'LexendDeca',
          color: MyColors.maze,
          fontWeight: FontWeight.w800,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
