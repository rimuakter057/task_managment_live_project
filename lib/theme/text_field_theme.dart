import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
inputDecorationTheme: InputDecorationTheme(
  filled: true,
  fillColor: Colors.blueGrey.shade50,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 16.0,
    horizontal: 12.0,
  ),
),

);
