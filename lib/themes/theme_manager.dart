import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[50],
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.grey[800],fontSize: 28,fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.grey[600],fontSize: 18),
      bodySmall: TextStyle(color:Colors.grey[500],fontSize: 14)
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[900],
    ),
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[300],
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.grey[900],
      elevation: 0,
      iconTheme:const IconThemeData(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.grey[400],fontSize: 20,fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.grey[500],fontSize: 18),
      bodySmall: TextStyle(color: Colors.grey[600],fontSize:14)
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[800],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.grey[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.grey[300],
    ),
  );

  ThemeMode _themeMode = ThemeMode.light;

  bool _isDark = false;

  ThemeMode get themeMode => _themeMode;

  bool get isDark=>_isDark;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      _isDark = true;
    } else {
      themeMode = ThemeMode.light;
      _isDark = false;
    }
    notifyListeners();
  }
}
