import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

Uuid obj = const Uuid();

enum Category { food, leisure, travel, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = obj.v4();
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  String getFormattedDate() {
    final format = DateFormat.yMd();
    String formatter = format.format(date);
    return formatter;
  }
}
