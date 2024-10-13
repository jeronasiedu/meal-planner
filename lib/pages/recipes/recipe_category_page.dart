import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealplanner/entities/recipe_category.dart';
import 'package:mealplanner/pages/recipes/recipe_details_page.dart';
import 'package:mealplanner/providers/recipes_by_category_provider.dart';
import 'package:mealplanner/widgets/recipe_card.dart';
import 'package:mealplanner/widgets/spinner.dart';

import '../../providers/recipe_details_provider.dart';

class RecipeCategoryPage extends ConsumerWidget {
  const RecipeCategoryPage({super.key, required this.category});

  final RecipeCategory category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipesByCategoryProvider(category.name));
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Hero(
              tag: category.id,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundImage: CachedNetworkImageProvider(category.imageUrl),
              ),
            ),
          )
        ],
      ),
      body: recipes.when(
        data: (data) {
          return GridView.builder(
            padding: const EdgeInsets.all(16),
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
                onTap: () async {
                  try {
                    final data = await ref.read(recipeDetailsProvider(recipe.id).future);
                    if (data == null || !context.mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeDetailsPage(recipe: data)),
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                },
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: Spinner());
        },
      ),
    );
  }
}
