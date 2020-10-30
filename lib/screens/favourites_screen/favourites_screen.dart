import 'package:flutter/material.dart';

import '../../models/meal.dart';
import '../../widgets/meal_item.dart';
import '../meal_detail_screen/meal_detail_screen.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  void _selectMeal(BuildContext context, String id) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (_, index) {
          return MealItem(
            id: widget.favouriteMeals[index].id,
            title: widget.favouriteMeals[index].title,
            affordability: widget.favouriteMeals[index].affordability,
            complexity: widget.favouriteMeals[index].complexity,
            duration: widget.favouriteMeals[index].duration,
            imageUrl: widget.favouriteMeals[index].imageUrl,
            selectMealFav: _selectMeal,
          );
        },
        itemCount: widget.favouriteMeals.length,
      );
    }
  }
}
