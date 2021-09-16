import 'package:flutter/material.dart';
import 'package:meals/meals_theme.dart';
import 'package:meals/models/filters.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/meal_screen.dart';
import 'package:meals/screens/tab_screen.dart';
import 'package:meals/utils/meals_dummy.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Meal> meals;

  late Filters filters;
  late List<String> favouriteMeals = [];

  @override
  void initState() {
    filters = Filters(
      isLactoseFree: false,
      isVegan: false,
      isVegetarian: false,
      isGlutenFree: false,
    );
    meals = DUMMY_MEALS;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyApp oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  _saveFilters(Filters updatedFilters) {
    setState(() {
      filters = updatedFilters;
      meals = DUMMY_MEALS.where((item) {
        if (filters.isGlutenFree && !item.isGlutenFree) return false;
        if (filters.isLactoseFree && !item.isLactoseFree) return false;
        if (filters.isVegan && !item.isVegan) return false;
        if (filters.isVegetarian && !item.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  List<Meal> get _favouriteMeals {
    return DUMMY_MEALS.where((e) {
      return favouriteMeals.contains(e.id);
    }).toList();
  }

  _toggleFav(id) {
    setState(() {
      if (favouriteMeals.contains(id))
        favouriteMeals.removeWhere((element) => element == id);
      else {
        favouriteMeals.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals',
      theme: MealsTheme.main(context),
      routes: {
        TabsScreen.routeName: (ctx) => TabsScreen(
              favouriteMeals: _favouriteMeals,
              toggleFavouriteMeal: _toggleFav,
            ),
        MealScreen.routeName: (ctx) => MealScreen(
              availableMeals: meals,
            ),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              favouriteMeals: favouriteMeals,
              toggleFavouriteMeal: _toggleFav,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              filter: filters,
              saveFilters: _saveFilters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (buildContext) {
          return CategoryScreen();
        });
      },
    );
  }
}
