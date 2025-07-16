import 'package:flutter/material.dart';
import 'package:recipe_app/screens/app_screens/profile_screen.dart';
import 'package:recipe_app/screens/app_screens/recipe_screen.dart';
import 'package:recipe_app/widgets/cutom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    RecipeScreen(),
    Center(child: Text("Search Page")),
    Center(child: Text("Favorites Page")),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CutomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
