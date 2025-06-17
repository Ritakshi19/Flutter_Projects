import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_meal_app/Model/meal.dart';
import 'package:my_meal_app/Widgets/itemRecipe.dart';

class ItemRecipeScreen extends StatelessWidget {
  ItemRecipeScreen({super.key, required this.meals, required Meal meal});
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    Widget itemRecipe = ListView.builder(
      itemCount: meals.length,
      itemBuilder:
          (context, index) => ItemRecipe(
            ingredients: meals[index].ingredients,
            steps: meals[index].steps,
            imageUrl: meals[index].imageUrl,
          ),
    );
    return itemRecipe;
  }
}
