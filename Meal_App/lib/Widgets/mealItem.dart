import 'package:flutter/material.dart';
import 'package:my_meal_app/Model/meal.dart';

class MealItem extends StatelessWidget {
final void Function(BuildContext, Meal meal) onMealItemTap;

  MealItem({required this.title, required this.imageUrl,required this.affordable,required this.complexity,required this.duration,required this.onMealItemTap,required this.meal});
  final String title;
  final Meal meal;
  final String imageUrl;
  final String duration;
  final String complexity;
  final String affordable;
  @override
  Widget build(BuildContext context) {
    return  Material(
    child: InkWell(
        onTap:(){
          onMealItemTap(context,meal);
        },
      
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  left: 8,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    child: Column(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.schedule, color: Colors.white),
                            Text(
                              duration,
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Spacer(),
                            Icon(Icons.work, color: Colors.white),
                            Text(
                              complexity,
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            Spacer(),
                            Icon(Icons.attach_money, color: Colors.white),
                            Text(
                              affordable,
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
      ),
    );
  }
}