import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key key, this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text('no favorites picked start choosing some favorites'),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              var meal = favoriteMeals[index];
              return MealItem(
                id: meal.id,
                title: meal.title,
                imageUrl: meal.imageUrl,
                affordability: meal.affordability,
                complexity: meal.complexity,
                duration: meal.duration,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
