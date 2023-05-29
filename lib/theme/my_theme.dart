import 'package:flutter/material.dart';

final myTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Color(0xFF077F8C),
    ),
    labelSmall: TextStyle(fontSize: 12.0, color: Color(0xFFF5F5F5)),
    labelMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Color(0xfff5f5f5),
    ),
  ),
);
