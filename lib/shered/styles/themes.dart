import 'package:flutter/material.dart';

import 'colors.dart';

const double kContentFontSize = 16.0;

ThemeData lightTheme() => ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(brightness: Brightness.light),
  fontFamily: 'SST Arabic',
  primaryColor: Appcolors.primary,
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    },
  ),
  unselectedWidgetColor: Appcolors.gree300,
  canvasColor: Appcolors.white,
  dividerColor: Appcolors.gree300,
  accentColor: Appcolors.accentPrimary,
  dialogTheme: DialogTheme(backgroundColor: Appcolors.white),
  highlightColor: Appcolors.black.withOpacity(0.1),
  splashColor: Appcolors.black.withOpacity(0.1),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
      height: 1.6,
      color: Appcolors.black,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: TextStyle(
      color: Color(0xff6f85d5),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    headline1: TextStyle(
      fontSize: 16,
      height: 1.5,
      color: Color(0xff6f85d5),
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 16,
      height: 1.5,
      color: Appcolors.white,
    ),
    button: TextStyle(
      fontSize: 14,
      color: Color(0xff6f85d5),
      height: 1,
    ),
  ),
  scrollbarTheme: ScrollbarThemeData(
    radius: Radius.circular(5),
    thumbColor: MaterialStateProperty.all(Appcolors.gree300),
  ),
  iconTheme: IconThemeData(color: Appcolors.gree400, size: 30),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Appcolors.gree300,
    filled: true,
    hintStyle: TextStyle(color: Appcolors.gree),
  ),
  buttonColor: Color(0xff6f85d5),
  //cardColor: Appcolors.grey[200],
);

ThemeData darkTheme() => ThemeData(
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(brightness: Brightness.dark),
  fontFamily: 'SST Arabic',
  primaryColor: Color(0xff6db7e5),
  pageTransitionsTheme: PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
    },
  ),
  canvasColor: Color(0xff10122C),
  dividerColor: Color(0xff3C387B),
  iconTheme: IconThemeData(color: Color(0xff3C387B), size: 30),
  unselectedWidgetColor: Appcolors.gree300,
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Appcolors.white24,
    filled: true,
    hintStyle: TextStyle(color: Colors.white38),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 16,
      height: 1.6,
      color: Appcolors.white,
      fontWeight: FontWeight.normal,
    ),
    subtitle1: TextStyle(
      color: Appcolors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    headline1: TextStyle(
      fontSize: 16,
      height: 1.5,
      color: Appcolors.white,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 16,
      height: 1.5,
      color: Appcolors.white,
    ),
    button: TextStyle(
      fontSize: 14,
      color: Color(0xff6f85d5),
      height: 1,
    ),
  ),
  accentColor: Appcolors.white,
  buttonColor: Color(0xff6f85d5),
  splashColor: Appcolors.black.withOpacity(0.1),
  highlightColor: Color(0xff3C387B).withOpacity(0.5),
  dialogTheme: DialogTheme(backgroundColor: Color(0xff1B2349)),
  cardColor: Color(0xff10122C),
  scrollbarTheme: ScrollbarThemeData(
    radius: Radius.circular(5),
    thumbColor: MaterialStateProperty.all(
      Color(0xff3C387B).withOpacity(0.5),
    ),
  ),
);
