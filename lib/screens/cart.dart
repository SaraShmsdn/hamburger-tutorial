import 'package:flutter/material.dart';

import '../main.dart';
import 'favorites.dart';

class CartScreen extends StatelessWidget {
  static const tag = "cart";

  void selectFavorites(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      FavoritesScreen.tag,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
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
                  onPressed: () {},
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
