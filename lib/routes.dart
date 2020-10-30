import 'package:flutter/cupertino.dart';

// import './screens/categories_screen/categories_screen.dart';
import './screens/category_meals_screen/category_meals_screen.dart';
import './screens/meal_detail_screen/meal_detail_screen.dart';
import './screens/tabs_screen/tabs_screen.dart';
import 'screens/filters_screen/filters_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => TabsScreen(),
  // CategoriesScreen.routeName : (BuildContext context) => CategoriesScreen(),
  CategoryMealsScreen.routeName: (BuildContext context) =>
      CategoryMealsScreen(),
  MealDetailScreen.routeName: (BuildContext context) => MealDetailScreen(),
  FiltersScreen.routeName: (BuildContext context) => FiltersScreen(),
};
