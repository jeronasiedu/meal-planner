import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:mealplanner/pages/favorites/favorites_page.dart';
import 'package:mealplanner/pages/recipes/recipes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedIndex = 0;
final pages = [const RecipesPage(), const FavoritesPage()];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(IconsaxPlusLinear.home),
            label: 'Home',
            selectedIcon: Icon(IconsaxPlusBold.home),
          ),
          NavigationDestination(
            icon: Icon(IconsaxPlusLinear.bookmark),
            selectedIcon: Icon(IconsaxPlusBold.bookmark),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
