

import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {

  static const routName = '/filters_screen';
 final Function updateFilters;
 final Map<String,bool> filters;
 FiltersScreen(this.filters,this.updateFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  var isGlutenFree = false;
  var isVegan = false;
  var isVegetarian = false;
  var isLactoseFree = false;

  @override
  void initState() {
     isGlutenFree = widget.filters['Gluten'];
     isLactoseFree = widget.filters['Lactose'];
     isVegan = widget.filters['Vegan'];
     isVegetarian = widget.filters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(icon: Icon(Icons.save),
                    onPressed: (){
                     final newFilters={
                       'Gluten': isGlutenFree,
                       'Lactose': isLactoseFree,
                       'Vegan': isVegan,
                       'vegetarian': isVegetarian,
                     };
                     widget.updateFilters(newFilters);
                    }
                    )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filters Your Meals',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten-Free'),
                    value: isGlutenFree,
                    onChanged:(value){
                    setState(() {
                      isGlutenFree = value ;
                    });
                    }
                ),
                SwitchListTile(
                    title: Text('Lactose-Free'),
                    value: isLactoseFree,
                    onChanged:(value){
                      setState(() {
                        isLactoseFree = value ;
                      });
                    }
                ),
                SwitchListTile(
                    title: Text('Vegetarian'),
                    value: isVegetarian,
                    onChanged:(value){
                      setState(() {
                        isVegetarian = value ;
                      });
                    }
                ),
                SwitchListTile(
                    title: Text('Vegan'),
                    value: isVegan,
                    onChanged:(value){
                      setState(() {
                        isVegan = value ;
                      });
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
