import 'package:flutter/material.dart';
import 'package:week5/models/meals.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem({required this.meal});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(meal.title),
    );
  }
}
