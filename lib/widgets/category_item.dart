import 'package:flutter/material.dart';
import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  final Image image;

  CategoryItem(
    this.id,
    this.title,
    this.color,
    this.image,
  );

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMeals.tag,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 200,
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      child: InkWell(
        //same as GestureDetector but with effect
        onTap: () {
          selectCategory(context);
        },
        //splashColor: Theme.of(context).primaryColor,
        //borderRadius: BorderRadius.circular(10),
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                //GestureDetector(
                Container(
                  child: image,
                  height: 125,
                ),
                //onTap: () {
                //selectCategory(context);
                //},
                //),
                Spacer(),
                Spacer(),
                /*Row(
                  children: [
                    Spacer(),
                    Container(
                      width: 50,
                      height: 50,
                      //child: Card(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      // shape: RoundedRectangleBorder(
                      //borderRadius: BorderRadius.circular(10),
                      //),
                      //),
                    ),
                  ],
                )*/
              ],
            ),
          ),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(15),
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
          ),
        ),
      ),
    );
  }
}
