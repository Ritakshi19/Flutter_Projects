import 'package:flutter/material.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';

class Expenseitemcard extends StatelessWidget {
  final Expense expense;

  Expenseitemcard(this.expense);
  @override
  Widget build(BuildContext context) {
    return Card( 
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(

          children: [
            Text(expense.title ,style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 4),
            Row( 
              children: [
                Text('\$' + expense.amount.toString(),), // backslash is used because $ is use for interpolation
                Spacer(),
                Row(
                  children: [
                    Icon(expense.getCategoryIcon(),),
                    Text(expense.category.name.toString(),),
                    SizedBox(width: 10),
                    Text(expense.getFormattedDate(),),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
