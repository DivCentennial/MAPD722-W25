import 'package:flutter/material.dart';
import 'package:week5/screens/MealListScreen.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({required this.category});

  void selectOneCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealListScreen(
              categoryId: category.id,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectOneCategory(context);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: category.color, borderRadius: BorderRadius.circular(15)),
        child: Text(
          category.title,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
