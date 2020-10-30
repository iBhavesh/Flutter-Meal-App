import 'package:flutter/material.dart';
import '../../widgets/custom_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = "/filters-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text('Filters'),
      ),
    );
  }
}
