import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabBarScreen extends StatefulWidget {
  List<Meal> favoriteMeals;
  TabBarScreen({Key key, this.favoriteMeals}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  List _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Favorites'
      },
    ];
  }

  void _pageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              label: 'Category'),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.favorite),
              label: 'favorite'),
        ],
        type: BottomNavigationBarType.shifting,
        onTap: _pageSelected,
        currentIndex: _selectedIndex,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
      ),
    );
  }
}
