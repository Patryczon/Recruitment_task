// import 'package:flutter/material.dart';
//
// final buttonTheme = ButtonThemeData(
//   buttonColor: Colors.teal,
//   textTheme: ButtonTextTheme.primary,
// );
// final inputDecorationTheme = InputDecorationTheme(
//   border: OutlineInputBorder(),
//   focusedBorder: OutlineInputBorder(
//     borderRadius: BorderRadius.circular(8),
//     borderSide: BorderSide(
//       color: Colors.teal,
//       width: 2.0,
//     ),
//   ),
// );
//
// final textTheme = TextTheme(
//   titleLarge: TextStyle(
//     fontSize: 24,
//     fontWeight: FontWeight.bold,
//   ),
//   titleMedium: TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//   ),
//   titleSmall: TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//   ),
//   bodyLarge: TextStyle(
//     fontSize: 18,
//   ),
//   bodyMedium: TextStyle(
//     fontSize: 16,
//   ),
//   bodySmall: TextStyle(
//     fontSize: 14,
//   ),
// );
//
// final darkThemeData = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: Colors.teal,
//   buttonTheme: buttonTheme,
//   inputDecorationTheme: inputDecorationTheme,
//   textTheme: textTheme,
// );
//create light theme based on this dark
import 'package:flutter/material.dart';

final buttonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    padding: WidgetStateProperty.all(
      const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
    ),
    backgroundColor: WidgetStateProperty.all(Colors.white),
    side: const WidgetStateProperty.fromMap({
      WidgetState.disabled: BorderSide(
        color: Colors.black,
        width: 2.0,
      ),
      WidgetState.any: BorderSide(
        color: Colors.teal,
        width: 2.0,
      ),
    }),
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

final lightThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.teal,
  elevatedButtonTheme: buttonTheme,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: inputDecorationTheme,
  textTheme: textTheme,
);
