import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal_detail_screen';
  final Function isFavorite;
  final Function toggleFavorite;

  const MealDetailScreen({Key key, this.isFavorite, this.toggleFavorite});

  Widget buildContianer(Widget listView) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2, color: Colors.grey),
      ),
      child: listView,
    );
  }

  Widget buildSectionTitle(BuildContext ctx, String title) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(ctx).textTheme.headline6,
        ));
  }

  @override
  Widget build(BuildContext context) {
    var mealId = ModalRoute.of(context).settings.arguments;
    var selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            )),
            buildSectionTitle(context, 'Ingredients'),
            buildContianer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(selectedMeal.ingredients[index]),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTitle(context, 'Steps'),
            buildContianer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text('#${index + 1}')),
                      title: Text('${selectedMeal.steps[index]}'),
                    ),
                    Divider()
                  ],
                );
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(isFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          toggleFavorite(mealId);
        },
      ),
    );
  }
}
