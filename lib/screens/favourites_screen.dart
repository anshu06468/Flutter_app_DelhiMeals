import './../widgets/meal_items.dart';

import './../models/meal.dart';
import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> _favouratesMeal;
  FavouritesScreen(this._favouratesMeal);

  @override
  Widget build(BuildContext context) {
    if (_favouratesMeal.isEmpty) {
      return Center(
        child: Text("Your Favourates list is Empty"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordability: _favouratesMeal[index].affordability,
            complexity: _favouratesMeal[index].complexity,
            duration: _favouratesMeal[index].duration,
            imgUrl: _favouratesMeal[index].imageUrl,
            title: _favouratesMeal[index].title,
            id: _favouratesMeal[index].id,
          );
        },
        itemCount: _favouratesMeal.length,
      );
    }
  }
}
