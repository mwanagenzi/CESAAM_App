import 'package:ceesam_app/theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CESAAMTheme {
  static ThemeData themeData() {
    return ThemeData(
    primaryColor: ColorPalette.primaryColor,
    accentColor: ColorPalette.secondaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: ColorPalette.primaryColor,
          elevation: 1.0,
          titleTextStyle:
              const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
      ),
      dividerColor: ColorPalette.secondaryColor,
      //TODO: Configure google fonts for app-wide use
      scaffoldBackgroundColor: Colors.white,
    );
  }
  //TODO: define app wide text theme
  //TODO: define app dark and light modes
}
