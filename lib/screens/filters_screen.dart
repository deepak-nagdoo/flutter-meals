import 'package:flutter/material.dart';
import 'package:meals/models/filters.dart';
import 'package:meals/screens/tab_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Filters filter;
  final Function saveFilters;

  const FiltersScreen({
    Key? key,
    required this.filter,
    required this.saveFilters,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _getSwitch(title, subTitle, value, Function onChange) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.headline2,
      ),
      onChanged: (value) => onChange(value),
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  widget.saveFilters(widget.filter);
                  Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.routeName);
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: [
            Container(
              child: Text(
                'Set priorities on meals!',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _getSwitch(
                    'Gluten',
                    'All meals will be gluten free.',
                    widget.filter.isGlutenFree,
                    (value) {
                      setState(() {
                        widget.filter.isGlutenFree = value;
                      });
                    },
                  ),
                  _getSwitch(
                    'Lactose',
                    'All meals will be lactose free.',
                    widget.filter.isLactoseFree,
                    (value) {
                      setState(() {
                        widget.filter.isLactoseFree = value;
                      });
                    },
                  ),
                  _getSwitch(
                    'Vegan',
                    'All meals will be vegan free.',
                    widget.filter.isVegan,
                    (value) {
                      setState(() {
                        widget.filter.isVegan = value;
                      });
                    },
                  ),
                  _getSwitch(
                    'Vegetarian',
                    'All meals will be vegetarian free.',
                    widget.filter.isVegetarian,
                    (value) {
                      setState(() {
                        widget.filter.isVegetarian = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
