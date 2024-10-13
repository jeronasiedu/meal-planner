import 'package:mealplanner/entities/basic_recipe.dart';

import 'ingredient.dart';

class CompleteRecipe extends BasicRecipe {
  final String category;
  final String area;
  final String instructions;
  final List<Ingredient> ingredients;
  final String youtubeUrl;
  final List<String> tags;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'area': area,
      'instructions': instructions,
      'imageUrl': imageUrl,
      'ingredients': ingredients.map((e) => e.toMap()).toList(),
      'youtubeUrl': youtubeUrl,
      'tags': tags,
    };
  }

  factory CompleteRecipe.fromBookmark(Map<String, dynamic> map) {
    return CompleteRecipe(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      area: map['area'],
      instructions: map['instructions'],
      imageUrl: map['imageUrl'],
      ingredients: map['ingredients'].map<Ingredient>((e) => Ingredient.fromMap(e)).toList(),
      youtubeUrl: map['youtubeUrl'],
      tags: map['tags'].map<String>((e) => e.toString()).toList(),
    );
  }

  factory CompleteRecipe.fromMap(Map<String, dynamic> map) {
    List<Ingredient> ingredients = [];
    List<String> tags = [];

    // Extract ingredients
    for (int i = 1; i <= 20; i++) {
      String? ingredient = map['strIngredient$i'];
      String? measure = map['strMeasure$i'];
      if (ingredient != null && ingredient.trim().isNotEmpty && measure != null && measure.trim().isNotEmpty) {
        ingredients.add(
          Ingredient(
            name: ingredient.trim(),
            measure: measure.trim(),
            imageUrl: 'https://www.themealdb.com/images/ingredients/${ingredient.trim()}-Small.png',
          ),
        );
      }
    }

    String? tempTags = map['strTags'];

    if (tempTags != null) {
      tags = tempTags.split(',').map<String>((String tag) => tag.trim()).where((String tag) => tag.isNotEmpty).toList();
    }

    return CompleteRecipe(
      id: map['idMeal'],
      name: map['strMeal'],
      category: map['strCategory'],
      area: map['strArea'],
      instructions: map['strInstructions'],
      imageUrl: map['strMealThumb'],
      ingredients: ingredients,
      youtubeUrl: map['strYoutube'],
      tags: tags,
    );
  }

  const CompleteRecipe({
    required super.id,
    required super.imageUrl,
    required super.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.ingredients,
    required this.youtubeUrl,
    required this.tags,
  });
}
