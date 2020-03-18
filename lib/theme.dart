import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_generator/colors.dart';

final appTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: accentColor,
  primaryColor: accentColor,
  toggleableActiveColor: accentColor,
  buttonColor: accentColor,
  sliderTheme: SliderThemeData(
    thumbColor: Colors.white,
    activeTrackColor: accentColor,
  ),
  scaffoldBackgroundColor: backgroundColor,
  fontFamily: GoogleFonts.nunito().fontFamily,
);
