import 'package:flutter/material.dart';
import 'package:meals/meals_theme.dart';
import 'package:meals/widgets/category/category_item.dart';
import '../utils//categories_dummy.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/categories';

  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: categories_dummy.length,
        itemBuilder: (ctx, index) {
          return CategoryItem(
            key: ValueKey(categories_dummy[index].id),
            id: categories_dummy[index].id,
            title: categories_dummy[index].title,
            color: categories_dummy[index].color,
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MealsTheme.dynamicWidth(context, 300),
          childAspectRatio: 3 / 2,
          crossAxisSpacing: MealsTheme.dynamicWidth(context, 10),
          mainAxisSpacing: MealsTheme.dynamicWidth(context, 10),
        ),
      ),
    );
  }
}
