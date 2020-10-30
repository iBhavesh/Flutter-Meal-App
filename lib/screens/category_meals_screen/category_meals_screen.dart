import 'package:flutter/material.dart';

import '../../models/meal.dart';
import './components/meal_item.dart';
import '../../data/dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> displayedMeals;
  bool _initialised = false;
  String _categoryTitle;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialised) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      _categoryTitle = routeArgs['title'];

      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(routeArgs['id']);
      }).toList();
      _initialised = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
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
            removeItem: _removeMeal,
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
