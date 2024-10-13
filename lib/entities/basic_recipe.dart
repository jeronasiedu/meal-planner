class BasicRecipe {
  final String id;
  final String name;
  final String imageUrl;

  const BasicRecipe({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory BasicRecipe.fromMap(Map<String, dynamic> map) {
    return BasicRecipe(
      id: map['idMeal'] as String,
      name: map['strMeal'] as String,
      imageUrl: map['strMealThumb'] as String,
    );
  }
}
