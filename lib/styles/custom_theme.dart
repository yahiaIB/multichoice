// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'custom_colors.dart';

class CustomTheme {
  //set your theme in MaterialApp
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: CustomColors.primaryColor,
    accentColor: CustomColors.accentColor,
    backgroundColor: Colors.white,
    buttonColor: CustomColors.buttonColor,
    // platform: TargetPlatform.iOS,
  );

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white,
      accentColor: CustomColors.accentColor,
      backgroundColor: Colors.black,
      buttonColor: CustomColors.buttonColor,
  );
}
