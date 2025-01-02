import 'package:cesaam_feedback_app/theme/color_palette.dart';
import 'package:flutter/material.dart';

class CESAAMTheme {
  static ThemeData themeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: ColorPalette.primaryColor,
        secondary: ColorPalette.secondaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorPalette.primaryColor,
        elevation: 1.0,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      dividerColor: ColorPalette.secondaryColor,
      scaffoldBackgroundColor: Colors.white,
      dialogBackgroundColor: Colors.white,
    );
  }
  //TODO: define app wide text theme
  //TODO: define app dark and light modes
}
