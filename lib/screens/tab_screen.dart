import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category_screen.dart';
import 'package:meals/screens/favourite_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  final Function toggleFavouriteMeal;
  const TabsScreen({
    Key? key,
    required this.favouriteMeals,
    required this.toggleFavouriteMeal,
  }) : super(key: key);
  static const routeName = '/';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var selected = 0;
  void _selectPage(index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> _screens = [
      {
        'page': CategoryScreen(),
        'title': 'Categories',
      },
      {
        'page': FavouriteScreen(
          favouriteMeals: widget.favouriteMeals,
          toggleFavouriteMeal: widget.toggleFavouriteMeal,
        ),
        'title': 'Favourite',
      },
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_screens[selected]['title'] as String),
        ),
        body: _screens[selected]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _selectPage(value),
          currentIndex: selected,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Favorite',
            ),
          ],
        ),
        drawer: MainDrawer(),
      ),
    );
  }
}
