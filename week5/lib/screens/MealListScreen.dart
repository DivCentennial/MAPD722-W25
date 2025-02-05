import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:week5/l10n/app_localizations.dart';
import 'package:week5/models/meals.dart';
import 'package:week5/widgets/MealItem.dart';

class MealListScreen extends StatelessWidget {
  final String categoryId;

  MealListScreen({required this.categoryId});

  final List<Meal> meals = [
    // Pizza
    Meal(id: 'm1', categoryId: 'c1', title: 'Margherita Pizza'),
    Meal(id: 'm2', categoryId: 'c1', title: 'Pepperoni Pizza'),
    Meal(id: 'm3', categoryId: 'c1', title: 'BBQ Chicken Pizza'),

    // Burgers
    Meal(id: 'm4', categoryId: 'c2', title: 'Cheeseburger'),
    Meal(id: 'm5', categoryId: 'c2', title: 'BBQ Bacon Burger'),

    // Salads
    Meal(id: 'm6', categoryId: 'c3', title: 'Caesar Salad'),
    Meal(id: 'm7', categoryId: 'c3', title: 'Greek Salad'),

    // Pasta
    Meal(id: 'm8', categoryId: 'c4', title: 'Spaghetti Carbonara'),
    Meal(id: 'm9', categoryId: 'c4', title: 'Fettuccine Alfredo'),
    Meal(id: 'm10', categoryId: 'c4', title: 'Lasagna'),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    var filterdMeals = meals.where((m) => m.categoryId == categoryId).toList();

    return (Scaffold(
      appBar: AppBar(title: Text(lang!.meals)),
      body: ListView.builder(
        itemCount: filterdMeals.length,
        itemBuilder: (context, index) => MealItem(meal: filterdMeals[index]),
      ),
    ));
  }
}
