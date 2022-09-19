import 'package:flutter/material.dart';
import '../screens/filters.dart';

import '../main.dart';

class MainDrawer extends StatefulWidget {
  static const tag = '/drawer';

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(45),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                  ),
                ]),
            child: Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Filter Meals', Icons.filter_alt_outlined, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.tag);
          }),
          buildListTile('Dark Mode', Icons.dark_mode_outlined, () {
            Navigator.of(context).pushReplacementNamed(
              MyApp.tag,
            );
          }),
        ],
      ),
    );
  }
}
