import 'package:delhimeals/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/category_meals';

  final Function toggleFirst;
  final Function isFavourate;

  MealDetailsScreen(this.toggleFirst, this.isFavourate);

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments;
    final selectedMeals = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealid;
    });

    Widget buildSectionTitle(BuildContext context, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildSetionContent(Widget child) {
      return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          height: 150,
          width: 300,
          child: child);
    }

    return Scaffold(
      appBar: AppBar(title: Text("${selectedMeals.title}")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildSetionContent(
              ListView.builder(
                  itemCount: selectedMeals.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(selectedMeals.ingredients[index])),
                      )),
            ),
            buildSectionTitle(context, "Steps"),
            buildSetionContent(ListView.builder(
              itemCount: selectedMeals.steps.length,
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(selectedMeals.steps[index]),
                  ),
                  Divider(
                    color: Colors.black,
                  )
                ],
              ),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavourate(mealid) ? Icons.star : Icons.star_border,
        ),
        onPressed: () {
          toggleFirst(mealid);
        },
      ),
    );
  }
}
