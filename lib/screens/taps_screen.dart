import 'package:flutter/material.dart';
import 'package:travels2/screens/categories_screen.dart';
import 'package:travels2/screens/favorites_screen.dart';
import 'package:travels2/screens/filters_screen.dart';
import '../widgets/app_drawer.dart';

class TapsScreen extends StatefulWidget {
  const TapsScreen({Key? key}) : super(key: key);

  static const tapsScreens = '/';
  @override
  State<TapsScreen> createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectScreenIndex = index;
    });
  }

  int _selectScreenIndex = 0;
  final List<Map<String, Object>> _screen = [
    {'screens': CategoriesScreen(), 'Title': 'التصنيفات'},
    {'screens': FavoritesScreen(), 'Title': 'الرحلات المفضلة'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(_screen[_selectScreenIndex]['Title'] as String),
        ),
      ),
      drawer: AppDrawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.

      ),
      body: _screen[_selectScreenIndex]['screens'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectScreenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              label: "التنصنيفات"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "المفضلة"),
        ],
      ),
    );
  }
}
