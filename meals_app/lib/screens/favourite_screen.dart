import 'package:flutter/cupertino.dart';

import '../items/meal_item.dart';
import '../models/meal.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> _favouriteMeal;

  FavouriteScreen(this._favouriteMeal);

  @override
  Widget build(BuildContext context) {
    if (_favouriteMeal.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favouriteMeal[index].id,
            title: _favouriteMeal[index].title,
            imageUrl: _favouriteMeal[index].imageUrl,
            duration: _favouriteMeal[index].duration,
            complexity: _favouriteMeal[index].complexity,
            affordability: _favouriteMeal[index].affordability,
          );
        },
        itemCount: _favouriteMeal.length,
      );
    }
  }
}
