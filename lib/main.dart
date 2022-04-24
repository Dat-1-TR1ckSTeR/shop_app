import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:shop_app/data/dummy_data.dart';
import 'package:shop_app/model/meal_model.dart';
import 'package:shop_app/screens/filters_screen.dart';
import 'package:shop_app/screens/meal_detail_screen.dart';
import 'package:shop_app/screens/tabs_screen.dart';

import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegan': false,
    'vegetarian': false,
    'lactoseFree': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        // _filters ?? false;
        if (_filters['glutenFree']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactoseFree']! && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealID) {
    final mealIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealID);

    if (mealIndex > -1) {
      setState(() {
        _favoriteMeals.removeAt(mealIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealID),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Colors.grey[400],
        //   textTheme: ThemeData.light().textTheme.copyWith(
        //         bodyText1: TextStyle(
        //           color: Colors.grey[850],
        //         ),
        //         bodyText2: TextStyle(
        //           color: Colors.grey[850],
        //         ),
        //         titleSmall: TextStyle(
        //           fontSize: 20,
        //         ),
        //         titleMedium: TextStyle(
        //           fontSize: 25,
        //         ),
        //         titleLarge: TextStyle(
        //           fontSize: 30,
        //         ),
        //       ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(favoriteMeal: _favoriteMeals),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isMealFav: _isMealFavorite,
            ),
        FiltersScreen.routeName: (context) => FiltersScreen(
              saveFilters: _setFilters,
              userFilters: _filters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },
    );
  }
}
