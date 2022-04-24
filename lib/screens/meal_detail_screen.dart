import 'package:flutter/material.dart';
import 'package:shop_app/model/meal_model.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatefulWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isMealFav;
  const MealDetailScreen({
    Key? key,
    required this.toggleFavorite,
    required this.isMealFav,
  }) : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget buildTitleSubBar(
    BuildContext context,
    String title,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 5,
        left: 15,
        right: 15,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
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
      margin: const EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 25,
        right: 25,
      ),
      padding: const EdgeInsets.all(10),
      height: containerHeight,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final specificMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(specificMeal.title),
          actions: [
            IconButton(
              onPressed: () {
                widget.toggleFavorite(specificMeal.id);
              },
              icon: widget.isMealFav(specificMeal.id)
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border_outlined),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  // padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
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
        ),
      ),
    );
  }
}
