import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  static const routeName = '/favourite';
  final List<Meal> favouriteMeals;
  final Function toggleFavouriteMeal;

  const FavouriteScreen({
    Key? key,
    required this.favouriteMeals,
    required this.toggleFavouriteMeal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(favouriteMeals);
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            key: ValueKey(favouriteMeals[index].id),
            meal: favouriteMeals[index],
            removeItem: () {},
          );
        },
        itemCount: favouriteMeals.length,
      ),
    );
  }
}
