import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import './components/section_container.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      height: 25,
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    const double imageHeight = 250;

    final appBar = AppBar(
      title: Text('${selectedMeal.title}'),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: imageHeight,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          SectionContainer(
            appBarSize: appBar.preferredSize,
            mediaQuery: mediaQuery,
            imageHeight: imageHeight,
            child: ListView.builder(
              itemBuilder: (_, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child:
                      Text('${index + 1}. ${selectedMeal.ingredients[index]}'),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          SectionContainer(
            appBarSize: appBar.preferredSize,
            mediaQuery: mediaQuery,
            imageHeight: imageHeight,
            child: ListView.builder(
              itemBuilder: (_, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('# ${index + 1}'),
                ),
                title: Text(selectedMeal.steps[index]),
              ),
              itemCount: selectedMeal.steps.length,
            ),
          ),
        ],
      ),
    );
  }
}
