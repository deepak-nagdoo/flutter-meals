import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meals/meals_theme.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeItem;

  MealItem({
    Key? key,
    required this.meal,
    required this.removeItem,
  }) : super(key: key);

  _tabMeal(ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: meal,
    )
        .then((value) {
      if (value != null) {
        Meal meal = value as Meal;
        removeItem(meal.id);
      }
    });
  }

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _tabMeal(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    // height: MealsTheme.dynamicHeight(context, 350),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: MealsTheme.dynamicWidth(context, 20),
                  // right: MealsTheme.dynamicWidth(context, 16),
                  child: Container(
                    width: MealsTheme.dynamicWidth(context, 300),
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
