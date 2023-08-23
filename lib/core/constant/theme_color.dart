import 'package:flutter/material.dart';

Color blueClor = const Color(0xFF4e5ae8);
Color yellowColor = const Color(0xFFFFB746);
Color pinkClor = const Color(0xFFff4667);
Color primaryColor = blueClor;
Color darkGreyColor = const Color(0xFF121212);
Color darkHeadColor = const Color(0xFF424242);

class Themes {
  static final ligth = ThemeData(
    // ignore: deprecated_member_use
    backgroundColor: Colors.white,
    primaryColor: primaryColor,
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
      // ignore: deprecated_member_use
      backgroundColor: darkGreyColor,
      primaryColor: darkGreyColor,
      brightness: Brightness.dark);
}
