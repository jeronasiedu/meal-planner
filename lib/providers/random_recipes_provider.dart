import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/complete_recipe.dart';
import '../utils/network.dart';

part 'random_recipes_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<CompleteRecipe>> randomRecipes(RandomRecipesRef ref, [int limit = 10]) async {
  const url = "https://themealdb.com/api/json/v1/1/random.php";
  final responses = await Future.wait(List.generate(limit, (index) => dio.get(url)));
  if (responses.every((response) => response.statusCode == 200)) {
    return responses.map((response) => CompleteRecipe.fromMap(response.data['meals'][0])).toList();
  }
  return [];
}
