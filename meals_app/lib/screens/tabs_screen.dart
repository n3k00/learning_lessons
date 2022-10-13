import 'package:flutter/material.dart';
import 'package:meals_app/items/main_drawer.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favourite_screen.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;

  TabsScreen(this.favouriteMeal);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPageIndex = 0;
  late final List<Map<String,Object>> _pages;
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex= index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
     _pages = [
      {
        'page':CategoriesScreen(),
        'title' : 'Categories'
      },
      {
        'page':FavouriteScreen(widget.favouriteMeal),
        'title' : 'Your Favourite'
      }
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'].toString()),
        ),

        body: _pages[_selectedPageIndex]['page'] as Widget,
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            )
          ],
        ),
    );
  }
}
