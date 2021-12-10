import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
 final String id;
 final String title;
 final String imageUrl;
 final int duration;
 final Complexity complexity;
 final Affordability affordability;


 MealItem({
   @required this.id,
   @required this.title,
   @required this.imageUrl,
 @required this.duration,
 @required this.complexity,
 @required this.affordability,

 });

 String get complexityText{
   switch(complexity){
     case Complexity.Simple:
       return 'Simple';
       break;
     case Complexity.Challenging:
       return 'Challenging';
       break;
     case Complexity.Hard:
       return 'Hard';
       break;
     default:
       return 'UnKnown';
   }
 }
 String get affordabilityText{
   switch(affordability){
     case Affordability.Affordable:
       return 'Affordable';
       break;
     case Affordability.Luxurious:
       return 'Luxurious';
       break;
     case Affordability.Pricey:
       return 'Pricey';
       break;
     default:
       return 'UnKnown';
   }
 }

  void selectedMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      MealDetail.routName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context) ,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ) ,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover ,
                  ),
                ),
                Positioned(
                  bottom:20 ,
                  right:10 ,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule,),
                      SizedBox(width: 6,),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work,),
                      SizedBox(width: 6,),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money,),
                      SizedBox(width: 6,),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
