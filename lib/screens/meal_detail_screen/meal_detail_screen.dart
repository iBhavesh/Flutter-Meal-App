import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);


    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: Center(
        child: Text('Meal Detail Screen - ${meal.id}'),
      ),
    );
  }
}
