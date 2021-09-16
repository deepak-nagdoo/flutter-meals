import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  _tabCategory(ctx) {
    Navigator.pushNamed(
      ctx,
      MealScreen.routeName,
      arguments: Category(id: id, title: title, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _tabCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
