import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputExpense extends StatefulWidget {
  const InputExpense(this.addExpense, {super.key});

  final void Function(Expense expense) addExpense;

  @override
  State<InputExpense> createState() {
    return _InputExpenseState();
  }
}

class _InputExpenseState extends State<InputExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final format = DateFormat.yMd();
  DateTime? selectedDate;
  Category selectedCategory = Category.leisure;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void openDatePicker() async {
    final futureValue = await showDatePicker(
        context: context, firstDate: DateTime(2000), lastDate: DateTime.now());
    setState(() {
      selectedDate = futureValue;
    });
  }

  void submitExpenseData() {
    final enteredAmount = double.tryParse(amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("Invalid Input"),
            content: const Text("Please enter all the valid credentials"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const Text("Okay"))
            ],
          );
        },
      );
      return;
    }
    widget.addExpense(Expense(
        title: titleController.text,
        amount: enteredAmount,
        date: selectedDate!,
        category: selectedCategory));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Amount"), prefixText: "\$ "),
                ),
              ),
              const Spacer(),
              Text(selectedDate == null
                  ? 'No date Selected'
                  : format.format(selectedDate!)),
              IconButton(
                  onPressed: openDatePicker,
                  icon: const Icon(Icons.date_range)),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              DropdownButton(
                  value: selectedCategory,
                  items: Category.values.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  onPressed: submitExpenseData,
                  child: const Text("Submit Expenses"))
            ],
          )
        ],
      ),
    );
  }
}
