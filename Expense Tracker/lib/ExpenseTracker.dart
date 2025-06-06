import 'package:flutter/material.dart';
import 'package:myexpensetrackerapp/ExpenseList.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';
import 'package:myexpensetrackerapp/NewExpense.dart';
import 'package:myexpensetrackerapp/SimpleBarChart.dart';

class ExpenseTracker extends StatefulWidget {
  @override
  State<ExpenseTracker> createState() {
    return ExpensetrackerState();
  }
}

class ExpensetrackerState extends State<ExpenseTracker> {
  List<Expense> registeredExpenses = [
    Expense(
      title: "Documents Editing",
      amount: 5,
      date: DateTime.now(),
      category: Category.Work,
    ),
    Expense(
      title: "Family Dinner",
      amount: 5,
      date: DateTime.now(),
      category: Category.Food,
    ),
  ];

  void openExpenseAdderOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: addExpense),
    );
  }

  addExpense(Expense expense) {
    //print(expense);
    setState(() {
      registeredExpenses.add(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense Added'),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  removeExpense(Expense expense) {
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense deleted"),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            setState(() {
              registeredExpenses.add(expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense"),
        actions: [
          IconButton(
            tooltip: "Add a new Expense",
            onPressed: openExpenseAdderOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),

      body:
          screenWidth < 500
              ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SimpleBarChart(expenses: registeredExpenses),
                  ),
                  // Text("Expense "),
                  Expanded(
                    child: Expenselist(
                      expenses: registeredExpenses,
                      onRemoveExpense: removeExpense,
                    ),
                  ),
                ],
              )
              : Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SimpleBarChart(expenses: registeredExpenses),
                    ),
                  ),
                  // Text("Expense "),
                  Expanded(
                    child: Expenselist(
                      expenses: registeredExpenses,
                      onRemoveExpense: removeExpense,
                    ),
                  ),
                ],
              ),
    );
  }
}
