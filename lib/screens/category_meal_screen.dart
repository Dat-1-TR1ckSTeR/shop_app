import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../data/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meal';

  const CategoryMealScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealScreen(
  //     {Key? key, required this.categoryId, required this.categoryTitle})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(
          title: categoryMeals[index].title,
          imageUrl: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          mealComplexity: categoryMeals[index].complexity,
          mealAffordability: categoryMeals[index].affordability,
        ),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
