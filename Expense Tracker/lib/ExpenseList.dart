import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myexpensetrackerapp/ExpenseItemCard.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';

class Expenselist extends StatelessWidget {
  List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  Expenselist({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (context, index) => Dismissible(
            key: ValueKey(expenses[index]),
            background: Container(
              decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin:EdgeInsets.symmetric(horizontal: 16,vertical: 8)
            ),
            child: Expenseitemcard(expenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
          ),
    );
  }
}
