import 'package:delhimeals/models/meal.dart';

import './../widgets/MainDrawer.dart';

import './favourites_screen.dart';
import './categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoritesMeal;

  TabsScreen(this._favoritesMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'title': 'Categpry',
        'pages': CategoriesScreen(),
      },
      {
        'title': 'Your Favourites',
        'pages': FavouritesScreen(widget._favoritesMeal),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    // print(_selectedPageIndex);
    setState(() {
      _selectedPageIndex = index;
      // print(_selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TopnavigationBar

    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       elevation: 10,
    //       title: Text("Meals"),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: 'Favourites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: [
    //         CategoriesScreen(),
    //         FavouritesScreen(),
    //       ],
    //     ),
    //   ),
    // );

    // BottomNavigationBar
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['pages'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
      ),
    );
  }
}
