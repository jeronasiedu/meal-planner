import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:mealplanner/providers/search_recipes_provider.dart';

import '../recipe_details_page.dart';

class RecipesSearchBar extends ConsumerStatefulWidget {
  const RecipesSearchBar({super.key});

  @override
  ConsumerState createState() => _RecipesSearchBarState();
}

class _RecipesSearchBarState extends ConsumerState<RecipesSearchBar> {
  final searchController = SearchController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SearchAnchor.bar(
        viewLeading: BackButton(
          onPressed: () {
            searchController.clear();
            searchController.closeView(null);
          },
        ),
        searchController: searchController,
        viewBackgroundColor: theme.colorScheme.surfaceContainerLowest,
        barHintText: "Search any recipes",
        barBackgroundColor: WidgetStatePropertyAll(theme.colorScheme.surfaceContainerLowest),
        barSide: WidgetStatePropertyAll(
          BorderSide(color: theme.dividerColor.withOpacity(0.2), width: 1),
        ),
        barLeading: const Icon(IconsaxPlusLinear.search_normal),
        suggestionsBuilder: (context, controller) async {
          if (searchController.text.isEmpty) {
            return [];
          }
          final query = controller.text;
          final recipes = await ref.watch(searchRecipesProvider(query).future);
          if (recipes.isEmpty) {
            return [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("No results found"),
                ),
              )
            ];
          }
          return List.generate(recipes.length, (index) {
            final recipe = recipes[index];
            return Padding(
              padding: const EdgeInsets.all(16).copyWith(top: index == 0 ? 8 : 0),
              child: ListTile(
                leading: CircleAvatar(
                  foregroundImage: CachedNetworkImageProvider(recipe.imageUrl),
                ),
                title: Text(recipe.name),
                onTap: () {
                  searchController.clear();
                  controller.closeView(null);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RecipeDetailsPage(recipe: recipe),
                  ));
                },
              ),
            );
          });
        },
      ),
    );
  }
}
