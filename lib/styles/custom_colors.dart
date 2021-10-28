import 'package:flutter/material.dart';

class CustomColors {
  //TODO Define your colors here
  const CustomColors();

  static const Color primaryColor =  Color.fromRGBO(255,255,255,1);
  static const buttonColor =  Color.fromRGBO(79,0,145,1);
  static const accentColor =  Color.fromRGBO(118,83,235,1);
  static const textGrayColor =  Color.fromRGBO(223,223,223,1);

}

class ColorHex extends Color {
  ColorHex(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
