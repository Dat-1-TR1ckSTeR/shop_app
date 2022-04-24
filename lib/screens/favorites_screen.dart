import 'package:flutter/material.dart';
import 'package:shop_app/model/meal_model.dart';
import 'package:shop_app/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;

  const FavoritesScreen({Key? key, required this.favoriteMeal})
      : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Meal> favoriteMeals = [];

  @override
  void initState() {
    favoriteMeals = widget.favoriteMeal;
    super.initState();
  }

  // FixMe
  // When Removing a Favorite Meal abd Popping Back To The Previous Page
  // The Meal is Still There!
  // Probably Due to Favorites Screen Prev State...

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => MealItem(
        id: widget.favoriteMeal[index].id,
        title: widget.favoriteMeal[index].title,
        imageUrl: widget.favoriteMeal[index].imageUrl,
        duration: widget.favoriteMeal[index].duration,
        mealComplexity: widget.favoriteMeal[index].complexity,
        mealAffordability: widget.favoriteMeal[index].affordability,
      ),
      itemCount: widget.favoriteMeal.length,
    );
  }
}
