import 'package:flutter/material.dart';
import 'package:meals/meals_app_bar.dart';

class MealsTheme {
  static main(BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        colorScheme: ColorScheme(
          primary: Colors.pink,
          secondary: Colors.amber,
          secondaryVariant: Colors.amberAccent,
          error: Colors.redAccent,
          background: Colors.yellowAccent,
          brightness: Brightness.light,
          onBackground: Colors.white10,
          onError: Colors.red,
          onPrimary: Colors.pink,
          onSecondary: Colors.amber,
          onSurface: Colors.white12,
          primaryVariant: Colors.white24,
          surface: Colors.white30,
        ),
        appBarTheme: appBar());
  }

  static appBar() {
    return AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    );
  }

  static singleUnit(BuildContext ctx) {
    return MediaQuery.of(ctx).size.width / 360;
  }

  static dynamicWidth(BuildContext ctx, width) {
    return singleUnit(ctx) * width;
  }

  static dynamicHeight(BuildContext ctx, height) {
    return MediaQuery.of(ctx).size.height - dynamicWidth(ctx, height);
  }

  static abstractDeviceHeight(BuildContext ctx, height) {
    return dynamicHeight(ctx, height) -
        MealsAppBar.appBar!.preferredSize.height -
        MediaQuery.of(ctx).padding.top;
  }
}
