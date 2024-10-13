import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealplanner/pages/recipes/see_more_recipes_page.dart';
import 'package:mealplanner/pages/recipes/widgets/popular_recipes.dart';
import 'package:mealplanner/pages/recipes/widgets/recipes_categories.dart';
import 'package:mealplanner/pages/recipes/widgets/recipes_search_bar.dart';
import 'package:mealplanner/pages/recipes/widgets/recommended_recipes.dart';
import 'package:mealplanner/providers/random_recipes_provider.dart';

class RecipesPage extends ConsumerWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi Jeron👋🏽", style: theme.textTheme.bodyLarge),
            const Text("Got a tasty dish in mind?"),
          ],
        ),
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          ref.invalidate(randomRecipesProvider);
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const RecipesSearchBar(),
            Text(
              "Categories",
              style: theme.textTheme.titleLarge,
            ),
            const RecipesCategories(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended for you",
                  style: theme.textTheme.titleLarge,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SeeMoreRecipesPage()));
                    },
                    child: const Text("See more"))
              ],
            ),
            const RecommendedRecipes(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recipes of the week",
                  style: theme.textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SeeMoreRecipesPage()));
                  },
                  child: const Text("See more"),
                )
              ],
            ),
            const PopularRecipes()
          ],
        ),
      ),
    );
  }
}
