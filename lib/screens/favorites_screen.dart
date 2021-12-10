import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
 final List<Meal> favoritesMeals;
  FavoritesScreen(this.favoritesMeals);

  @override
  Widget build(BuildContext context) {
    if(favoritesMeals.isEmpty){
      return Center(
        child: Text('NO Favorites Meals Yet- Start adding some'),
      );
    }else{
      return  ListView.builder(
        itemBuilder: (context,index){
          return MealItem(
            id: favoritesMeals[index].id,
            title: favoritesMeals[index].title,
            imageUrl:favoritesMeals[index].imageUrl,
            duration: favoritesMeals[index].duration,
            complexity: favoritesMeals[index].complexity,
            affordability: favoritesMeals[index].affordability,
          );
        },
        itemCount: favoritesMeals.length  ,
      );
    }

  }
}
