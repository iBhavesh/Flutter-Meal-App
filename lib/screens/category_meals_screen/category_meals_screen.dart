import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> _displayedMeals;
  bool _initialised = false;
  String _categoryTitle;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialised) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _categoryTitle = routeArgs['title'];

      _displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(routeArgs['id']);
      }).toList();
      _initialised = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _categoryTitle,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id: _displayedMeals[index].id,
            title: _displayedMeals[index].title,
            affordability: _displayedMeals[index].affordability,
            complexity: _displayedMeals[index].complexity,
            duration: _displayedMeals[index].duration,
            imageUrl: _displayedMeals[index].imageUrl,
          );
        },
        itemCount: _displayedMeals.length,
      ),
    );
  }
}
