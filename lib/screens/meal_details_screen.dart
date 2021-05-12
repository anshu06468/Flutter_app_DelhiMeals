import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/category_meals';

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("titasd")),
      body: Center(
        child: Text("$mealid df"),
      ),
    );
  }
}
