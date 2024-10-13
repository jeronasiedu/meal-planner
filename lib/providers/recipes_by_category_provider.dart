import 'package:mealplanner/entities/basic_recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/network.dart';

part 'recipes_by_category_provider.g.dart';

@riverpod
Future<List<BasicRecipe>> recipesByCategory(RecipesByCategoryRef ref, String category) async {
  final url = "https://themealdb.com/api/json/v1/1/filter.php?c=$category";
  final response = await dio.get(url);
  if (response.statusCode == 200) {
    final data = response.data['meals'];
    return List.from(data).map((e) => BasicRecipe.fromMap(e)).toList();
  }
  return [];
}
