import 'package:flutter/material.dart';

import '../screens/filters_screen/filters_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          padding: EdgeInsets.all(20),
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile('Meals',Icons.restaurant,() {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile('Filters',Icons.settings,() {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }

  ListTile buildListTile(String title,IconData icon, Function tapHandler) {
    return ListTile(
        onTap: tapHandler,
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      );
  }
}
