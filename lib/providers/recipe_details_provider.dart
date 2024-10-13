import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/complete_recipe.dart';
import '../utils/network.dart';

part 'recipe_details_provider.g.dart';

@riverpod
Future<CompleteRecipe?> recipeDetails(RecipeDetailsRef ref, String mealId) async {
  final url = "https://themealdb.com/api/json/v1/1/lookup.php?i=$mealId";
  final response = await dio.get(url);
  if (response.statusCode == 200) {
    final data = response.data['meals'][0];
    return CompleteRecipe.fromMap(data);
  }
  return null;
}
