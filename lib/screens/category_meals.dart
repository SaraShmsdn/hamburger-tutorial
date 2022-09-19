import 'package:flutter/material.dart';
import 'package:hamburger/models/meal.dart';

import '../main.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import 'cart.dart';
import 'favorites.dart';

class CategoryMeals extends StatelessWidget {
  //final String categoryId;
  //final String categoryTitle;

  static const tag = "category-meals";

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);

  //CategoryMeals(this.categoryId, this.categoryTitle);

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
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            price: categoryMeals[index].price,
            rate: categoryMeals[index].rate,
            duration: categoryMeals[index].duration,
          );
        },
        itemCount: categoryMeals.length,
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
