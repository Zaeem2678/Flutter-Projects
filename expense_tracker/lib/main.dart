import 'package:expense_tracker/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 16, 6, 44));

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 10, 11, 71),
          foregroundColor: Colors.white),
      cardTheme: const CardTheme(
          color: Color.fromARGB(255, 207, 195, 209),
          margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8)),
    ),
    debugShowCheckedModeBanner: false,
    home: const Expenses(),
  ));
}
