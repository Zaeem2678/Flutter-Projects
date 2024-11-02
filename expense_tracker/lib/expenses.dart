import 'package:expense_tracker/expense_item.dart';
import 'package:expense_tracker/input_expense.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void openDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return InputExpense(addExpense);
        });
  }

  final List<Expense> registeredExpenses = [
    Expense(
        title: 'FLutter',
        amount: 100,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Cinema',
        amount: 200,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Ticket',
        amount: 100,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(onPressed: openDialog, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: registeredExpenses.length,
        itemBuilder: (context, index) {
          final expense = registeredExpenses[index];
          return Dismissible(
            key: ValueKey(expense), // Use a unique key, e.g., expense object
            direction: DismissDirection.endToStart, // Swipe from right to left
            onDismissed: (direction) {
              setState(() {
                registeredExpenses.removeAt(index);
              });

              // Optionally, show a confirmation snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${expense.title} dismissed')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ExpenseItem(expense),
          );
        },
      ),
    );
  }
}
