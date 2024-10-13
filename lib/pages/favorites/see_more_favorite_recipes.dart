import 'package:flutter/material.dart';

import '../../entities/complete_recipe.dart';
import '../../widgets/recipe_card.dart';
import '../recipes/recipe_details_page.dart';

class SeeMoreFavoriteRecipesPage extends StatelessWidget {
  const SeeMoreFavoriteRecipesPage({super.key, required this.recipes, required this.category});

  final String category;
  final List<CompleteRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return RecipeCard(
            id: recipe.id,
            name: recipe.name,
            imageUrl: recipe.imageUrl,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsPage(recipe: recipe)));
            },
          );
        },
      ),
    );
  }
}
