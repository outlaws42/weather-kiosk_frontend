import 'package:flutter/material.dart';

class ThemeConfig {
  //
  ThemeConfig._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(35, 38, 37, 1),
    appBarTheme: AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      elevation: 10,
      color: Color.fromRGBO(35, 38, 37, 1),
    ),
    iconTheme: IconThemeData(
      color: Colors.teal,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 65.0,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        fontFamily: 'Ubuntu',
        color: Color.fromRGBO(255, 255, 255, .85), // white
        fontSize: 55.0,
        fontWeight: FontWeight.bold,
        // backgroundColor: Colors.black,
      ),
      headline3: TextStyle(
        fontFamily: 'Ubuntu',
        color: Colors.teal,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Colors.green,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        fontFamily: 'Ubuntu',
        color: Color.fromRGBO(255, 255, 255, .85), // white
        fontSize: 19.0,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        fontFamily: 'Ubuntu',
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        //side: BorderSide(color: Color(0xFFE7bd3b), width: 2),
      ),
      padding: EdgeInsets.all(18),
      buttonColor: Color(0xFF4286f4), // blue 0xFF4286f4 yellow 0xFFE7bd3b
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF464646), // 0xFF3D3D3D
    appBarTheme: AppBarTheme(
      color: Color(0xFF464646),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 65.0,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
        color: Colors.white70,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      headline4: TextStyle(
        color: Colors.green,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      headline5: TextStyle(
        color: Colors.red,
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
      ),
      headline6: TextStyle(
        color: Colors.white54,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
        //side: BorderSide(color: Color(0xFFE7bd3b), width: 2),
      ),
      padding: EdgeInsets.all(18),
      buttonColor: Color(0xFF4286f4), // blue 0xFF4286f4 yellow 0xFFE7bd3b
    ),
  );
}
