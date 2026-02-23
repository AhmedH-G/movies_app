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
          fontWeight: FontWeight.w500,
          color: ColorPallete.primaryColor,
        ),
      )
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData();
  }
}