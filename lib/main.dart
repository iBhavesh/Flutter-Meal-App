import 'package:flutter/material.dart';

// import './screens/categories_screen/categories_screen.dart';
import './screens/route_not_found_screen/route_not_found_screen.dart';
import './screens/category_meals_screen/category_meals_screen.dart';
import './screens/meal_detail_screen/meal_detail_screen.dart';
import './screens/tabs_screen/tabs_screen.dart';
import 'screens/filters_screen/filters_screen.dart';

import './models/filters.dart';
import './models/meal.dart';
import './data/dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _filters = Filters();

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _toggleFavourites(String mealId) {
    final isFavourite = _favouriteMeals.any((element) => element.id == mealId);
    if (isFavourite) {
      setState(() {
        _favouriteMeals.removeWhere((element) => element.id == mealId);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String mealId) {
    return _favouriteMeals.any((element) => element.id == mealId);
  }

  void _saveFilters(Filters filters, BuildContext context) {
    setState(() {
      _filters = filters;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters.isGlutenFree && !meal.isGlutenFree) {
          return false;
        }
        if (_filters.isLactoseFree && !meal.isLactoseFree) {
          return false;
        }
        if (_filters.isVegan && !meal.isVegan) {
          return false;
        }
        if (_filters.isVegetarian && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (BuildContext context) => TabsScreen(_favouriteMeals),
        // CategoriesScreen.routeName : (BuildContext context) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (BuildContext context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (BuildContext context) =>
            MealDetailScreen(_toggleFavourites,_isMealFavourite),
        FiltersScreen.routeName: (BuildContext context) =>
            FiltersScreen(_saveFilters, _filters),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => RouteNotFoundScreen());
      },
    );
  }
}
