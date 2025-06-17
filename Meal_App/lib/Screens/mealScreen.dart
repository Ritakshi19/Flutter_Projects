import 'package:flutter/material.dart';
import 'package:my_meal_app/Model/meal.dart';
import 'package:my_meal_app/Screens/itemRecipeScreen.dart';
import 'package:my_meal_app/Widgets/mealItem.dart';

class MealScreen extends StatelessWidget {
  MealScreen({super.key, required this.title, required this.meals});
  final List<Meal> meals;
  final String title;

  @override
  Widget build(BuildContext context) {
    onMealSelected(BuildContext context, Meal meal) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ItemRecipeScreen(meal: meal, meals: [meal]),
        ),
      );
    }

    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder:
          (ctx, index) => MealItem(
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            affordable: meals[index].affordability.toString(),
            duration: meals[index].duration.toString(),
            complexity: meals[index].complexity.toString(),
            onMealItemTap: onMealSelected,
            meal: meals[index],
          ),
    );

    if (meals.isEmpty) {
      content = AlertDialog(
        title: Text("No Item"),
        content: Text("Oops!!...Nothing to display"),
      );
    }
    return content;
  }
}
