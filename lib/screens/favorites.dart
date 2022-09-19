import 'package:flutter/material.dart';
import 'package:hamburger/models/meal.dart';

import '../widgets/meal_item.dart';
import 'cart.dart';
import '../main.dart';

class FavoritesScreen extends StatelessWidget {
  static const tag = "favorites";
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

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
    if (favoriteMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: Center(child: Text('You have no FAVORITES yet')),
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
                    onPressed: () {},
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
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              price: favoriteMeals[index].price,
              rate: favoriteMeals[index].rate,
              duration: favoriteMeals[index].duration,
            );
          },
          itemCount: favoriteMeals.length,
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
                      //selectFavorites(context);
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
}
