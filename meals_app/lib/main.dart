import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/screens/category_males_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String,bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favouriteMeal = [];

  void _setFilter(Map<String,bool> filterData){
    setState(() {
      _filter = filterData;
      _availableMeal = DUMMY_MEALS.where((meal){
        if(_filter['gluten']! && !meal.isGlutenFree){
          return false;
        }
        if(_filter['lactose']! && !meal.isLactoseFree){
          return false;
        }
        if(_filter['vegan']! && !meal.isVegan){
          return false;
        }
        if(_filter['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }
  void toggleFavourite(String mealId){
    final exitingIndex = _favouriteMeal.indexWhere((meal) => meal.id == mealId);
    print(exitingIndex);
    if(exitingIndex>=0){
      setState(() {
        _favouriteMeal.removeAt(exitingIndex);
      });
    }else{
      setState(() {
        _favouriteMeal.add(
            DUMMY_MEALS.firstWhere((meal) => meal.id == mealId)
        );
      });
    }
  }
  bool _isFavouriteMeal(String mealId){
    return _favouriteMeal.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyMedium: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodySmall: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      //home: TabsScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeal),
        CategoryMalesScreen.routeName: (ctx) => CategoryMalesScreen(_availableMeal),
        MealDetailScreen.nameRoute: (ctx) => MealDetailScreen(toggleFavourite,_isFavouriteMeal),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filter,_setFilter)
      },
    );
  }
}
