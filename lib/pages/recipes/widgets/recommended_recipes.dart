import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealplanner/pages/recipes/recipe_details_page.dart';
import 'package:mealplanner/providers/random_recipes_provider.dart';

import '../../../widgets/spinner.dart';

class RecommendedRecipes extends ConsumerWidget {
  const RecommendedRecipes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final recipes = ref.watch(randomRecipesProvider(6));
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: SizedBox(
        height: 200,
        child: recipes.when(
          data: (data) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final recipe = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsPage(recipe: recipe),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Hero(
                            tag: recipe.id,
                            child: Card(
                              margin: const EdgeInsets.only(bottom: 4),
                              child: CachedNetworkImage(
                                imageUrl: recipe.imageUrl,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder: (context, url, progress) => const Center(child: Spinner()),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          recipe.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 14),
              itemCount: data.length,
            );
          },
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => const Center(child: Spinner()),
        ),
      ),
    );
  }
}
