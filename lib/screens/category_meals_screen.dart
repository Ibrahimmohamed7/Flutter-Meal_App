import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

import '../dummy_data.dart';


class CategoryMealsScreen extends StatefulWidget {
//final String category_id;
//final String category_title;
//CategoryMealsScreen({this.category_id,this.category_title});
static const routName = '/category-meals-screen';
final List<Meal> availableMeals;
CategoryMealsScreen(this.availableMeals,);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  String category_title;
  String category_id;
  List<Meal> categoryMeals;
  bool firstLoding= false;

  @override
  void didChangeDependencies() {
    if(!firstLoding) {
      final routArgs = ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      category_title = routArgs['title'];
      category_id = routArgs['id'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(category_id);
      }).toList();
      firstLoding = true;
    }
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(
      appBar: AppBar(
        title: Text(category_title),
      ),
      body: ListView.builder(
        itemBuilder: (context,index){
           return MealItem(
               id: categoryMeals[index].id,
               title: categoryMeals[index].title,
               imageUrl:categoryMeals[index].imageUrl,
               duration: categoryMeals[index].duration,
               complexity: categoryMeals[index].complexity,
               affordability: categoryMeals[index].affordability,
           );
          },
        itemCount: categoryMeals.length  ,
      )
    );
  }


}
