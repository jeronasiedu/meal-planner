import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealplanner/entities/recipe_category.dart';
import 'package:mealplanner/pages/recipes/recipe_category_page.dart';
import 'package:mealplanner/providers/recipes_categories_provider.dart';
import 'package:mealplanner/widgets/spinner.dart';

class RecipesCategories extends ConsumerWidget {
  const RecipesCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(recipeCategoriesProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: SizedBox(
        height: 100,
        child: switch (categories) {
          AsyncData(value: List<RecipeCategory> data) => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecipeCategoryPage(category: category)),
                    );
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 80,
                          child: Card.filled(
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Hero(
                                tag: category.id,
                                child: CachedNetworkImage(
                                  imageUrl: category.imageUrl,
                                  progressIndicatorBuilder: (context, url, progress) => const Center(child: Spinner()),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(category.name)
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemCount: data.length,
            ),
          AsyncError(:final error) => Text(error.toString()),
          _ => const Center(child: Spinner()),
        },
      ),
    );
  }
}
