import 'package:flutter/material.dart';
import 'package:meals/meals_theme.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatefulWidget {
  final List<String> favouriteMeals;
  final Function toggleFavouriteMeal;
  static const routeName = '/meal-detail';

  const MealDetailScreen({
    Key? key,
    required this.favouriteMeals,
    required this.toggleFavouriteMeal,
  }) : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildTitle(context, title) {
    return Container(
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildSteps(ctx, child) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        height: MealsTheme.dynamicHeight(ctx, 470),
        width: MealsTheme.dynamicWidth(ctx, 240),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)?.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.id}'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.star,
              size: 40,
            ),
            onPressed: () => widget.toggleFavouriteMeal(meal.id),
            color: widget.favouriteMeals.contains(meal.id)
                ? Colors.amber
                : Colors.white,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(meal);
        },
        child: Icon(
          Icons.delete,
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.maxFinite,
              cacheHeight: 320,
            ),
            buildTitle(context, 'Ingredients'),
            buildSteps(
              context,
              ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    color: Colors.amberAccent,
                    child: Text(
                      meal.ingredients[index],
                      style: Theme.of(ctx).textTheme.headline2,
                    ),
                  );
                },
              ),
            ),
            buildTitle(context, 'Steps'),
            buildSteps(
              context,
              ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('# $index'),
                    ),
                    title: Text(
                      meal.steps[index],
                      style: Theme.of(ctx).textTheme.headline2,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
