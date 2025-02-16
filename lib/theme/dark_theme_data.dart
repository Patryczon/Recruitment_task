import 'package:flutter/material.dart';

final buttonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
    ),
    backgroundColor: WidgetStateProperty.all(Colors.transparent),
    side: WidgetStateProperty.all(
      const BorderSide(
        color: Colors.teal,
        width: 2.0,
      ),
    ),
    textStyle: WidgetStateProperty.all(
      const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ),
);
final inputDecorationTheme = InputDecorationTheme(
  border: const OutlineInputBorder(),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(
      color: Colors.teal,
      width: 2.0,
    ),
  ),
);

const textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  titleSmall: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
  bodyLarge: TextStyle(
    fontSize: 18,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
  ),
  bodySmall: TextStyle(
    fontSize: 14,
  ),
);

final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.teal,
  elevatedButtonTheme: buttonTheme,
  scaffoldBackgroundColor: Colors.black,
  inputDecorationTheme: inputDecorationTheme,
  textTheme: textTheme,
);
