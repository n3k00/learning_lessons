import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const nameRoute = "/meal-detail";

  final Function toggleFavourite;
  final Function isFavaouriteMeal;

  MealDetailScreen(this.toggleFavourite,this.isFavaouriteMeal);


  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedmeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          BuildSectionTitle("Ingredients"),
          BuildContainer(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedmeal.ingredients[index],
                    ),
                  ),
                );
              },
              itemCount: selectedmeal.ingredients.length,
            ),
          ),
          BuildSectionTitle("Steps"),
          BuildContainer(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("# ${index + 1}"),
                      ),
                      title: Text(
                        selectedmeal.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: selectedmeal.steps.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavaouriteMeal(mealId)?Icon(Icons.favorite):Icon(Icons.favorite_outline),
        onPressed: ()=>toggleFavourite(mealId) ,
      ),
    );
  }
}

class BuildContainer extends StatelessWidget {
  final Widget child;

  const BuildContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }
}

class BuildSectionTitle extends StatelessWidget {
  final String textTitle;

  const BuildSectionTitle(this.textTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        textTitle,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
