import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../main.dart';
import 'cart.dart';
import 'favorites.dart';

class MealDetail extends StatelessWidget {
  static const tag = 'meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  MealDetail(this.toggleFavorite, this.isFavorite);

  void selectFavorites(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      FavoritesScreen.tag,
      //arguments: {'id': id, 'title': title},
    );
  }

  void selectCart(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CartScreen.tag,
      //arguments: {'id': id, 'title': title},
    );
  }

  void selectHome(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MyApp.tag,
      //arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'), actions: [
        IconButton(
          icon:
              Icon(isFavorite(mealId) ? Icons.favorite : Icons.favorite_border),
          onPressed: () => toggleFavorite(mealId),
        )
      ]),
      body: Column(
        children: [
          Container(
            height: 270,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              ),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              'INGREDIENTS',
              style: TextStyle(
                fontSize: 38,
                fontFamily: 'fontNew',
                foreground: Paint()
                  ..shader = ui.Gradient.linear(
                    const Offset(0, 80),
                    const Offset(150, 20),
                    <Color>[
                      Colors.green.shade300,
                      Colors.amber,
                    ],
                  ),
              ),
            ),
          ),
          Container(
            height: 270,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
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
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectHome(context);
        },
        child: Icon(
          Icons.home,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(45),
        ),
        child: Container(
          color: Colors.black26,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {
                    selectCart(context);
                  },
                  icon: Icon(Icons.shopping_cart),
                  color: Colors.white,
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  onPressed: () {
                    selectFavorites(context);
                  },
                  icon: Icon(Icons.turned_in),
                  color: Colors.white,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
