import 'package:flutter/material.dart';
import 'package:meals/components/drawer.dart.dart';
import 'package:meals/scrreens/categories_screen.dart';
import 'package:meals/scrreens/favorite_screen.dart';

class TabaScreen extends StatefulWidget {
  const TabaScreen({super.key});

  @override
  State<TabaScreen> createState() => _TabaScreenState();
}

class _TabaScreenState extends State<TabaScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': const CategoriesScreen()},
    {'title': 'Lista de Favoritos', 'screen': const FavoriteScreen()},
  ];
  _selectedScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
