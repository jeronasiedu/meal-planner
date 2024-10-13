import 'package:mealplanner/entities/recipe_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/network.dart';

part 'recipes_categories_provider.g.dart';

@riverpod
FutureOr<List<RecipeCategory>> recipeCategories(RecipeCategoriesRef ref) async {
  const url = "https://themealdb.com/api/json/v1/1/categories.php";
  final response = await dio.get(url);
  if (response.statusCode != 200) {
    throw Exception(response.statusMessage);
  }
  ref.keepAlive();
  final data = response.data['categories'];
  return List.from(data).map((e) => RecipeCategory.fromMap(e)).toList();
}
