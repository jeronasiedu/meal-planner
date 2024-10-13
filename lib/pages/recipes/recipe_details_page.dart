import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:mealplanner/entities/complete_recipe.dart';
import 'package:mealplanner/widgets/recipe_instructions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/bookmarks_provider.dart';

class RecipeDetailsPage extends HookConsumerWidget {
  const RecipeDetailsPage({super.key, required this.recipe});

  final CompleteRecipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    const maxInstructionChars = 400;
    ref.watch(bookmarksProvider);
    final isBookmarked = ref.read(bookmarksProvider.notifier).isBookmarked(recipe.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surfaceContainerLowest,
        title: Text(recipe.name),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                if (isBookmarked) {
                  ref.read(bookmarksProvider.notifier).remove(recipe.id);
                } else {
                  ref.read(bookmarksProvider.notifier).add(recipe);
                }
              },
              tooltip: isBookmarked ? "Remove from bookmarks" : "Add to bookmarks",
              icon: Icon(
                isBookmarked ? IconsaxPlusBold.heart : IconsaxPlusLinear.heart,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 80),
          children: [
            Hero(
              tag: recipe.id,
              child: CachedNetworkImage(
                imageUrl: recipe.imageUrl,
                fit: BoxFit.cover,
                height: 400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    children: List.generate(
                      recipe.tags.length,
                      (index) {
                        return Chip(label: Text(recipe.tags[index]));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, top: 10),
                    child: Row(
                      children: [
                        const Icon(IconsaxPlusLinear.note_2, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          "Instructions",
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text.rich(
                      maxLines: 12,
                      overflow: TextOverflow.ellipsis,
                      TextSpan(
                        style: theme.textTheme.bodyLarge,
                        children: [
                          TextSpan(
                            text: recipe.instructions.substring(
                                0,
                                recipe.instructions.length > maxInstructionChars
                                    ? maxInstructionChars
                                    : recipe.instructions.length),
                          ),
                          if (recipe.instructions.length > maxInstructionChars)
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showRecipeInstructions(context: context, instructions: recipe.instructions);
                                },
                              text: " ...Read more",
                              style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.primary),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.local_drink_outlined, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          "Ingredients",
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    runSpacing: 10,
                    children: List.generate(recipe.ingredients.length, (index) {
                      final ingredient = recipe.ingredients[index];
                      return ListTile(
                        title: Text(ingredient.name),
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundImage: CachedNetworkImageProvider(ingredient.imageUrl),
                        ),
                        subtitle: Text(ingredient.measure),
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          launchUrl(Uri.parse(recipe.youtubeUrl)).then((value) {}).catchError((e) {});
        },
        icon: const Icon(IconsaxPlusLinear.play),
        label: const Text("Watch video"),
      ),
    );
  }
}
