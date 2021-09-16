import 'package:flutter/material.dart';

class MealsAppBar {
  static AppBar? appBar;

  static bar(BuildContext context, List<Widget> actions) {
    appBar = AppBar(
      title: Text(
        'Test Sample App',
        style: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      
    );
    return appBar;
  }
}
