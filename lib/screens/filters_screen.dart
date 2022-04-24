import 'package:flutter/material.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> userFilters;
  final Function saveFilters;

  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.userFilters})
      : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegetarian = false;
  var _lactoseFree = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.userFilters['glutenFree']!;
    _vegan = widget.userFilters['vegan']!;
    _vegetarian = widget.userFilters['vegetarian']!;
    _lactoseFree = widget.userFilters['lactoseFree']!;
  }

  Widget _buildSwitchListTile(
    String switchTitle,
    String switchSubtitle,
    bool currentValue,
    Function(bool)? updateValue,
  ) {
    return SwitchListTile(
      title: Text(switchTitle),
      subtitle: Text(switchSubtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              onPressed: () {
                final _selectedFilters = {
                  'glutenFree': _glutenFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'lactoseFree': _lactoseFree
                };
                widget.saveFilters(_selectedFilters);
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Text('Perosnal Filters'),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    'Gluten-free',
                    'Only Gluten-free Meals Will be Shown',
                    _glutenFree,
                    (newValue) {
                      setState(
                        () {
                          _glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegan',
                    'Only Vegan Meals Will be Shown',
                    _vegan,
                    (newValue) {
                      setState(
                        () {
                          _vegan = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Vegetarian',
                    'Only Vegetarian Meals Will be Shown',
                    _vegetarian,
                    (newValue) {
                      setState(
                        () {
                          _vegetarian = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Lactos-Free',
                    'Only Lactos-Free Meals Will be Shown',
                    _lactoseFree,
                    (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
