import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealplanner/providers/random_recipes_provider.dart';
import 'package:mealplanner/widgets/recipe_card.dart';
import 'package:mealplanner/widgets/spinner.dart';

import '../recipe_details_page.dart';

class PopularRecipes extends ConsumerWidget {
  const PopularRecipes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(randomRecipesProvider(14));
    return recipes.when(
      data: (data) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final recipe = data[index];
            return RecipeCard(
              id: recipe.id,
              name: recipe.name,
              imageUrl: recipe.imageUrl,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeDetailsPage(recipe: recipe)));
              },
            );
          },
        );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(child: Spinner()),
    );
  }
}
