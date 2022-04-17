import 'package:flutter/material.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildTitleSubBar(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(
    Widget child,
    double containerHeight,
    double containerWidth,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      height: containerHeight,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final specificMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  specificMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitleSubBar(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(specificMeal.ingredients[index]),
                    ),
                    elevation: 5,
                  ),
                  itemCount: specificMeal.ingredients.length,
                ),
                200,
                200,
              ),
              buildTitleSubBar(context, 'How To Make:'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        ),
                        title: Text(specificMeal.steps[index]),
                      ),
                      const Divider(
                        thickness: 2.0,
                      ),
                    ],
                  ),
                  itemCount: specificMeal.steps.length,
                ),
                300,
                200,
              ),
            ],
          ),
        ),
    );
  }
}
