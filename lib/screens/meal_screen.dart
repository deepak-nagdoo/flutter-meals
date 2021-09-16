import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal/meal_item.dart';

class MealScreen extends StatefulWidget {
  static const routeName = '/meals';
  final List<Meal> availableMeals;

  const MealScreen({
    Key? key,
    required this.availableMeals,
  }) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late String title;
  late List<Meal> meals;
  var _firstLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_firstLoaded) {
      Category arguments =
          ModalRoute.of(context)?.settings.arguments as Category;
      title = arguments.title;
      meals = widget.availableMeals
          .where((meal) => meal.categories.contains(arguments.id))
          .toList();
      _firstLoaded = true;
    }
  }

  _removeItem(id) {
    setState(() {
      meals.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: meals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            key: ValueKey(meals[index].id),
            meal: meals[index],
            removeItem: _removeItem,
          );
        },
      ),
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
