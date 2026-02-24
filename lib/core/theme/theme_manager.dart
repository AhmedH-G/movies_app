import 'package:flutter/material.dart';

import 'color_pallete.dart';

abstract class ThemeManager {
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: ColorPallete.primaryColor,
      scaffoldBackgroundColor: ColorPallete.scaffoldBackgroungColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorPallete.primaryColor),
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontFamily: "Inter",
          fontWeight: FontWeight.w500,
          color: ColorPallete.primaryColor,
        ),
      ),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w500,
          fontFamily: "Inter",
          color: ColorPallete.generalTextColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontFamily: "Inter",
          fontWeight: FontWeight.w700,
          color: ColorPallete.generalTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: "Inter",
          color: ColorPallete.generalTextColor,
        ),
      )
    );
  }



  static ThemeData getDarkTheme() {
    return ThemeData();
  }
}