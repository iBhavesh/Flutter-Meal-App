import 'package:flutter/material.dart';

import '../../models/filters.dart';
import '../../widgets/custom_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters-screen";
  final Function saveFilters;
  final Filters filters;

  FiltersScreen(this.saveFilters,this.filters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _filters = Filters();

  @override
  void initState() {
    _filters = widget.filters;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget.saveFilters(_filters,context),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your Meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _filters.isVegan,
                  (value) {
                    setState(() {
                      _filters.isVegan = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _filters.isVegetarian,
                  (value) {
                    setState(() {
                      _filters.isVegetarian = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals',
                  _filters.isLactoseFree,
                  (value) {
                    setState(() {
                      _filters.isLactoseFree = value;
                    });
                  },
                ),
                buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  _filters.isGlutenFree,
                  (value) {
                    setState(() {
                      _filters.isGlutenFree = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function toggle,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: toggle);
  }
}
