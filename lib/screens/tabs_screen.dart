import 'package:flutter/material.dart';
import 'package:shop_app/widgets/main_drawer.dart';

import 'favorites_screen.dart';
import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Favorites',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    {
      // return DefaultTabController(
      //   length: 2,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       title: const Text('Meals'),
      //     bottom: const TabBar(
      //       tabs: [
      //         Tab(
      //           icon: Icon(Icons.category),
      //           text: 'Categories',
      //         ),
      //         Tab(
      //           icon: Icon(Icons.star),
      //           text: 'Favorites',
      //         ),
      //       ],
      //     ),
      //     ),
      //     body: const TabBarView(
      //       children: [
      //         CategoriesScreen(),
      //         FavoritesScreen(),
      //       ],
      //     ),
      //   ),
      // );}
      return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
        ),
        drawer: const MainDrawer(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          // type: BottomNavigationBarType.shifting,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.category,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.star,
              ),
              backgroundColor: Theme.of(context).primaryColor,
              label: 'Favorite',
            ),
          ],
        ),
      );
    }
  }
}
