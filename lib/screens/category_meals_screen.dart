import 'package:delhimeals/widgets/meal_items.dart';

import './../dummy_data.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/categories_meals';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categorymeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              affordability: categorymeals[index].affordability,
              complexity: categorymeals[index].complexity,
              duration: categorymeals[index].duration,
              imgUrl: categorymeals[index].imageUrl,
              title: categorymeals[index].title,
              id: categorymeals[index].id,
            );
          },
          itemCount: categorymeals.length,
        ));
  }
}
