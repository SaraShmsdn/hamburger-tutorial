import 'package:flutter/material.dart';

import '../screens/meal_detail.dart';
import '../models/meal.dart';
import '../screens/category_meals.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final double price;
  final Rate rate;

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetail.tag,
      arguments: {
        'id': id,
      },
    );
  }

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rate,
    required this.duration,
  });

  String get rateText {
    switch (rate) {
      case Rate.Fine:
        return 'Fine';
        break;
      case Rate.Good:
        return 'Good';
        break;
      case Rate.Excellent:
        return 'Excellent';
        break;
      default:
        return 'Unkown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: 200,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          selectMeal(context);
        },
        child: Card(
          color: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 8.0,
                  ),
                  child: Text(
                    (title),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 3.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '$duration min',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.work,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            rateText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            '$price',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
