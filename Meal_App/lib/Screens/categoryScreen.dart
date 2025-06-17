import 'package:flutter/material.dart';
import 'package:my_meal_app/Data/dummyData.dart';
import 'package:my_meal_app/Model/category.dart';
import 'package:my_meal_app/Screens/mealScreen.dart';
import 'package:my_meal_app/Widgets/categoryGridItem.dart';

class Categoryscreen extends StatelessWidget {
  onCategorySelect(BuildContext context,Category category) {
    var filteredMeals= dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealScreen(title: "title", meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Your Catogory")),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (Category category in availableCategories)
            Categorygriditem(
              category: category,
              onCategoryGridItemTap: onCategorySelect,
            ),
        ],
      ),
    );
  }
}
