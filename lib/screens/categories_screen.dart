import 'package:delhimeals/widgets/category_item.dart';
import 'package:delhimeals/dummy_data.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DelhiMeals"),
      ),
      // body: GridView.builder(
      //   itemCount: DUMMY_CATEGORIES.length,
      //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //     maxCrossAxisExtent: 200,
      //     childAspectRatio: 3 / 2,
      //     crossAxisSpacing: 20,
      //     mainAxisSpacing: 20,
      //   ),
      //   itemBuilder: (context, index) => CategoryItem(
      //       DUMMY_CATEGORIES[index].title, DUMMY_CATEGORIES[index].color),
      // ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(
                  e.title,
                  e.color,
                  e.id,
                ))
            .toList(),
      ),
    );
  }
}
