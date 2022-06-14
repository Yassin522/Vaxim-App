import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vaxim/constants/app_color.dart';

class AppTheme {
  AppTheme._();
  static final AppTheme _instance = AppTheme._();
  static AppTheme get instance => _instance;

  ThemeData themeData() {
    return ThemeData(
      primarySwatch: Colors.brown,
      primaryColor: kPrimary,
      textTheme: GoogleFonts.jostTextTheme(),
      scaffoldBackgroundColor: const Color(0xffF1F1F1),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        color: kAppBgColor,
        titleSpacing: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: kDark,
        ),
      ),
    );
  }
}
