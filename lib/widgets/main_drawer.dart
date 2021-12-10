import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title,IconData icon, Function onTapHandler){
    return ListTile(
      onTap: onTapHandler,
      leading: Icon(icon,size: 26,) ,
      title: Text(
          title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ) ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
                "Cooking Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20,),
          buildListTile(
              'Meals',
              Icons.restaurant,
              (){
                Navigator.of(context).pushReplacementNamed('/');
              }
          ),
          buildListTile(
              'Filters',
              Icons.settings,
              (){
                Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);
              }
          ),
        ],
      ),
    );
  }
}
