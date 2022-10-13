import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/items/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMalesScreen extends StatefulWidget {
  static const routeName = '/category-males';
  final List<Meal> _availableMale;

  CategoryMalesScreen(this._availableMale);

  @override
  State<CategoryMalesScreen> createState() => _CategoryMalesScreenState();
}

class _CategoryMalesScreenState extends State<CategoryMalesScreen> {
  late final String categoryTitle;
  late List<Meal> displayMeal;
  var _loadInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'].toString();
      final categoryId = routeArgs['id'];
      displayMeal = widget._availableMale
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadInitData = true;
    }
    super.didChangeDependencies();
  }
  void removeMeal(String mealId){
    setState(() {
      displayMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: displayMeal[index].id,
              title: displayMeal[index].title,
              imageUrl: displayMeal[index].imageUrl,
              duration: displayMeal[index].duration,
              complexity: displayMeal[index].complexity,
              affordability: displayMeal[index].affordability,);
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
