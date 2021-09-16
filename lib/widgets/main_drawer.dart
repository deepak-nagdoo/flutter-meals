import 'package:flutter/material.dart';
import 'package:meals/meals_app_bar.dart';
import 'package:meals/meals_theme.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/tab_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _menuItem(title, IconData icon, VoidCallback openScreen) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
      ),
      onTap: openScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Text(
              'Menu Items',
              style: Theme.of(context).textTheme.headline1,
            ),
            _menuItem(
              'Main',
              Icons.category,
              () {
                Navigator.pushReplacementNamed(
                  context,
                  TabsScreen.routeName,
                );
              },
            ),
            _menuItem(
              'Filters',
              Icons.filter,
              () {
                Navigator.pushReplacementNamed(
                  context,
                  FiltersScreen.routeName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
