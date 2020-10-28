import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final List<String> categories, ingredients, steps;
  final String id, title, imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree, isLactoseFree, isVegan, isVegetarian;

  const Meal({
    @required this.id,
    @required this.affordability,
    @required this.title,
    @required this.categories,
    @required this.complexity,
    @required this.duration,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    this.isGlutenFree,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian
  });
}
