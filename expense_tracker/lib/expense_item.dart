import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.singleExpense, {super.key});

  final Expense singleExpense;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Text(singleExpense.title),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text("\$${singleExpense.amount}"),
                  const Spacer(),
                  Text(singleExpense.getFormattedDate().toString()),
                  const SizedBox(
                    width: 4,
                  ),
                  Icon(categoryIcons[singleExpense.category]),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
