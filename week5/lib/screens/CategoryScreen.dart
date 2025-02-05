import 'package:flutter/material.dart';
import 'package:week5/l10n/app_localizations.dart';
import 'package:week5/widgets/categoryItem.dart';
import '../models/category.dart';

class CategoryScreen extends StatelessWidget {
  final List<Category> categories = [
    Category(id: 'c1', title: 'Pizza', color: Colors.red),
    Category(id: 'c2', title: 'Burgers', color: Colors.blue),
    Category(id: 'c3', title: 'Salads', color: Colors.green),
    Category(id: 'c4', title: 'Pasta', color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(lang!.title),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              maxCrossAxisExtent: 200),
          children: categories
              .map((category) => CategoryItem(category: category))
              .toList(),
        ));
  }
}
