import 'package:flutter/material.dart';
import 'package:my_meal_app/Model/category.dart';

class Categorygriditem extends StatelessWidget {
  final void Function(BuildContext, Category) onCategoryGridItemTap;

  final Category category;
  Categorygriditem({super.key, required this.category, required this.onCategoryGridItemTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onCategoryGridItemTap(context, category);
      },
      splashColor: Color.fromARGB(232, 187, 58, 58),
      borderRadius: BorderRadius.circular(16),
      
      
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.4),
              category.color.withOpacity(0.95),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 243, 240, 245),
          ),
        ),
      ),
    );
  }
}
