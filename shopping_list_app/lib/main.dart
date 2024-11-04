import 'package:flutter/material.dart';
import 'package:shopping_list_app/grocery_list.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 152, 102, 199));
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Groceries',
    theme: ThemeData(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: const Color.fromARGB(250, 158, 143, 221)),
    home: const GroceryList(),
  ));
}
