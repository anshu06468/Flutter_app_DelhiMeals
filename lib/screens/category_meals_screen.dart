import './../models/meal.dart';
import './../widgets/meal_items.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/categories_meals';

  final List<Meal> _availableMeals;

  CategoryMealScreen(this._availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration,
              imgUrl: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title,
              id: displayedMeals[index].id,
            );
          },
          itemCount: displayedMeals.length,
        ));
  }
}
