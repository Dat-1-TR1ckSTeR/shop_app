import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const CategoriesScreen(),
      routes: {
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
      },
    );
  }
}
