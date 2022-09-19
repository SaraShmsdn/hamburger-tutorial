import 'package:flutter/material.dart';
import 'package:hamburger/dummy_data.dart';
import 'package:hamburger/models/meal.dart';
import 'package:hamburger/screens/favorites.dart';
import 'package:hamburger/screens/filters.dart';
import 'package:hamburger/widgets/main_drawer.dart';

import './screens/meal_detail.dart';
import './screens/category_meals.dart';

import 'header.dart';
import 'screens/cart.dart';
import 'screens/categories.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static const tag = "home";

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoritedMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactos'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritedMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritedMeals
            .add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoritedMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        cardColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
        ),
        bottomAppBarColor: Colors.teal,
        appBarTheme: const AppBarTheme(color: Colors.teal, centerTitle: true),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
              subtitle2: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      home: Hamburger(context),
      routes: {
        CategoryMeals.tag: (_) => CategoryMeals(_availableMeals),
        MealDetail.tag: (_) => MealDetail(_toggleFavorite, _isMealFavorite),
        FavoritesScreen.tag: (_) => FavoritesScreen(_favoritedMeals),
        CartScreen.tag: (_) => CartScreen(),
        MyApp.tag: (_) => MyApp(),
        MainDrawer.tag: (_) => MainDrawer(),
        FilterScreen.tag: (_) => FilterScreen(_filters, _setFilters),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class Hamburger extends StatefulWidget {
  const Hamburger(this.context, {Key? key}) : super(key: key);
  final BuildContext context;
  @override
  State<Hamburger> createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  void selectFavorites(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(FavoritesScreen.tag
        //arguments: {'id': id, 'title': title},
        );
  }

  void selectCart(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CartScreen.tag,
      //arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text("Deliver Me"),
            /*leading: IconButton(
                onPressed: () {},
                icon: Icon(Icons.menu)),*/
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
          ),
          Header(),
          Categories(),
          //HamburgerList(row: 1),
          //HamburgerList(row: 2),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                    selectFavorites(widget.context);
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
