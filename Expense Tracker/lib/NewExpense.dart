import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpensetrackerapp/Model/Expense.dart';

final formatter = DateFormat().add_yMd();

class NewExpense extends StatefulWidget {
  final void Function(Expense) onAddExpense;
  NewExpense({required this.onAddExpense});
  @override
  State<NewExpense> createState() {
    return NewexpenseState();
  }
}

class NewexpenseState extends State<NewExpense> {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController amountTextEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Category selectedCategory = Category.Food;
  presentDatePicker() async {
    //DateTime now = DateTime.now();
    DateTime firstDate = DateTime(2025, 1, 1);
    DateTime lastDate = DateTime(2025, 12, 31);

    final dateSelected = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      selectedDate = dateSelected!;
    });
  }

  saveNewExpense() {
    print('save');
    //DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(selectedDate!);
    Expense expense = Expense(
      title: titleTextEditingController.text,
      amount: double.parse(amountTextEditingController.text),
      date: selectedDate,
      category: selectedCategory,
    );
    widget.onAddExpense(expense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            maxLength: 50,
            controller: titleTextEditingController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$',
                    labelText: 'Amount',
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(formatter.format(selectedDate).toString()),
                    IconButton(
                      onPressed: presentDatePicker,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: selectedCategory,
                items: [
                  DropdownMenuItem(value: Category.Work, child: Text('Work')),
                  DropdownMenuItem(value: Category.Food, child: Text('Food')),
                  DropdownMenuItem(
                    value: Category.Leisure,
                    child: Text('Leisure'),
                  ),
                  DropdownMenuItem(
                    value: Category.Travel,
                    child: Text('Travel'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              SizedBox(width: 5),
              ElevatedButton(
                
                onPressed: saveNewExpense,
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
