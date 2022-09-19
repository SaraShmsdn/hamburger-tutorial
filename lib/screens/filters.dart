import 'package:flutter/material.dart';
import 'package:hamburger/widgets/main_drawer.dart';

import '../main.dart';
import 'cart.dart';
import 'favorites.dart';

class FilterScreen extends StatefulWidget {
  static const tag = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    _lactoseFree = widget.currentFilters['lactose'] ?? false;
    super.initState();
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        //automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save)),
        ],
      ),
      //drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection:',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 28,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text(
                    'Gluten-Free',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  value: _glutenFree,
                  subtitle: Text('Only gluten-free meals',
                      style: TextStyle(fontSize: 16)),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Vegetarian',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  value: _vegetarian,
                  subtitle: Text('Only vegetarian meals',
                      style: TextStyle(fontSize: 16)),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Vegan',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  value: _vegan,
                  subtitle:
                      Text('Only vegan meals', style: TextStyle(fontSize: 16)),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text(
                    'Lactose-Free',
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  value: _lactoseFree,
                  subtitle: Text('Only lactose-free meals',
                      style: TextStyle(fontSize: 16)),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
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
