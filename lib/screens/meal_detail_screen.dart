import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import '../dummy_data.dart';

class MealDetail extends StatelessWidget {

  static const routName = '/meal-detail';

  final Function toggleFavorites;
  final Function isFavorite;
  MealDetail(this.toggleFavorites,this.isFavorite);



Widget sectionTitle(BuildContext context, String text){
    return Container(
  margin: EdgeInsets.all(10),
  child: Text(
  text,
  style: Theme.of(context).textTheme.title,
  ),
  );
}
Widget sectionContainer(Widget child){
  return  Container(
      height: 150,
      width: 400,
      margin: EdgeInsets.all(10),
  padding: EdgeInsets.all(10),
  decoration: BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.grey),
  borderRadius: BorderRadius.circular(10),
  ),
    child: child,
  );
}
  @override
  Widget build(BuildContext context) {
    final meal_id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == meal_id );
    return  Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal_id) ? Icons.star : Icons.star_border),
        onPressed: (){
          toggleFavorites(selectedMeal.id);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                  selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle(context, 'Ingrediants'),
           sectionContainer(
             ListView.builder(
             itemBuilder: (ctx,index) => Card(
               color: Theme.of(context).accentColor,
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 child: Text(selectedMeal.ingredients[index]),
               ) ,
             ),
             itemCount: selectedMeal.ingredients.length,
           ),
           ),
            sectionTitle(context, 'Steps'),
            sectionContainer(
              ListView.builder(
                  itemBuilder: (ctx,index) => ListTile(
                    leading: CircleAvatar(child: Text("# ${index+1}"),),
                    title: Text(selectedMeal.steps[index]),
                  ) ,
                itemCount: selectedMeal.steps.length,
              )
            )

          ],
        ),
      ),
    );
  }
}
