import './../widgets/MainDrawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function _saveFilters;
  final Map<String, bool> _currentFilters;

  FilterScreen(
    this._currentFilters,
    this._saveFilters,
  );

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _glutenFree = widget.currentFilters['gluten'];
  // //   _lactoseFree = widget.currentFilters['lacotse'];
  //   _vegan = widget.currentFilters['vegan'];
  //   _vegetarian = widget.currentFilters['vegetarian'];
  //   super.initState();
  // }

  @override
  initState() {
    _glutenFree = widget._currentFilters['gluten'];
    _lactoseFree = widget._currentFilters['lactose'];
    _vegan = widget._currentFilters['vegan'];
    _vegetarian = widget._currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selectedfilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget._saveFilters(selectedfilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection.",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                      "Gluten-free",
                      "Only includes gluten-free meals",
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Lactose-free",
                      "Only includes lactose-free meals",
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Vegetarian",
                      "Only includes Vegetairian meals",
                      _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      "Vegan", "Only includes Vegan meals", _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
