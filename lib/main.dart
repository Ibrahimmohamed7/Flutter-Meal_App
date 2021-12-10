import 'package:flutter/material.dart';

import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String,bool> filters={
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'vegetarian': false,
  };
List<Meal> availableMeals = DUMMY_MEALS;
List<Meal> favoritesMeals = [];
 void updateFilters(Map<String,bool> newFilters){
    setState(() {
      filters = newFilters;

      availableMeals = DUMMY_MEALS.where((meal){
        if(filters['Gluten'] && !meal.isGlutenFree)
        {
          return false;
        }
        if(filters['Lactose'] && !meal.isLactoseFree)
        {
          return false;
        }
        if(filters['Vegan'] && !meal.isVegan)
        {
          return false;
        }
        if(filters['vegetarian'] && !meal.isVegetarian)
        {
          return false;
        }
        return true;
      }).toList();
    });
  }
   void toggleFavorites(String mealID){
   final currentIndex = favoritesMeals.indexWhere((meal) => meal.id == mealID );
   if(currentIndex >=0){
     setState(() {
       favoritesMeals.removeAt(currentIndex);
     });
   }else{
     setState(() {
       favoritesMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealID));
     });
   }
   }

  bool isFavorite(String mealID){
    return favoritesMeals.any((meal) => meal.id == mealID);
 }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: 'Viaoda',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2:   TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1)
            ),
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'Viaoda',
            fontWeight: FontWeight.bold
          )
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(favoritesMeals),
        CategoryMealsScreen.routName: (context) => CategoryMealsScreen(availableMeals),
        MealDetail.routName: (Context) =>  MealDetail(toggleFavorites,isFavorite),
        FiltersScreen.routName: (context) => FiltersScreen(filters,updateFilters),
      },
    );
  }
}




