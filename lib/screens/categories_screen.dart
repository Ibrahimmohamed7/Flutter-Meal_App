import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/widgets/CategoryItem.dart';


class CategoriesScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(20) ,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200 ,
          childAspectRatio: 3 / 2 ,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((catData) => CategoryItem(catData.id, catData.title, catData.color)).toList()
      );
  }
}
