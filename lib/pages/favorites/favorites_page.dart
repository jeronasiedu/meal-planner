import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealplanner/pages/favorites/see_more_favorite_recipes.dart';
import 'package:mealplanner/providers/bookmarks_provider.dart';
import 'package:mealplanner/utils/extensions.dart';

import '../../widgets/spinner.dart';
import '../recipes/recipe_details_page.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmarks = ref.watch(bookmarksProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Recipes"),
      ),
      body: bookmarks.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Image.asset(
                      'assets/recipe-book.png',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "No favourites yet",
                    style: theme.textTheme.titleLarge,
                  ),
                ],
              ),
            );
          }
          final groupedBookmarks = data.groupBy((e) => e.category);
          return ListView(
            padding: const EdgeInsets.all(16),
            children: groupedBookmarks.entries.map((e) {
              final category = e.key;
              final recipes = e.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 600) {
                      return SizedBox(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final recipe = recipes[index];
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
                                height: 200,
                                width: 200,
                                child: Card(
                                  child: CachedNetworkImage(
                                    imageUrl: recipe.imageUrl,
                                    placeholder: (context, url) => const Center(child: Spinner()),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(width: 14),
                          itemCount: recipes.length,
                        ),
                      );
                    }
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              category,
                              style: theme.textTheme.titleLarge,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SeeMoreFavoriteRecipesPage(
                                      category: category,
                                      recipes: recipes,
                                    ),
                                  ));
                                },
                                child: const Text("See more"))
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RecipeDetailsPage(recipe: recipes.first),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: CachedNetworkImage(
                                    imageUrl: recipes.first.imageUrl,
                                    placeholder: (context, url) => const Center(child: Spinner()),
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: GestureDetector(
                                        onTap: () {
                                          final recipe = recipes.length > 1 ? recipes[1] : recipes[0];
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => RecipeDetailsPage(recipe: recipe),
                                            ),
                                          );
                                        },
                                        child: Card(
                                          child: CachedNetworkImage(
                                            imageUrl: recipes.length > 1 ? recipes[1].imageUrl : recipes[0].imageUrl,
                                            width: double.maxFinite,
                                            placeholder: (context, url) => const Center(child: Spinner()),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Stack(children: [
                                        GestureDetector(
                                          onTap: () {
                                            final recipe = recipes.length > 2 ? recipes[2] : recipes[0];
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => RecipeDetailsPage(recipe: recipe),
                                              ),
                                            );
                                          },
                                          child: Card(
                                            child: CachedNetworkImage(
                                              imageUrl: recipes.length > 2 ? recipes[2].imageUrl : recipes[0].imageUrl,
                                              width: double.maxFinite,
                                              placeholder: (context, url) => const Center(child: Spinner()),
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        if (recipes.length > 3)
                                          Positioned(
                                            top: 4,
                                            left: 4,
                                            right: 4,
                                            bottom: 4,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => SeeMoreFavoriteRecipesPage(
                                                    category: category,
                                                    recipes: recipes,
                                                  ),
                                                ));
                                              },
                                              child: Container(
                                                width: double.maxFinite,
                                                height: double.maxFinite,
                                                alignment: Alignment.center,
                                                padding: const EdgeInsets.all(4),
                                                decoration: ShapeDecoration(
                                                  shape: ContinuousRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)),
                                                  color: Colors.black45,
                                                ),
                                                // color: Colors.red,
                                                child: Text(
                                                  "+${recipes.length - 3}\nRecipes",
                                                  textAlign: TextAlign.center,
                                                  style: theme.textTheme.titleLarge!.copyWith(color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                      ]),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          );
        },
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
        loading: () => const Center(child: Spinner()),
      ),
    );
  }
}
