class RecipeCategory {
  final String id;
  final String name;
  final String imageUrl;

  const RecipeCategory({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory RecipeCategory.fromMap(Map<String, dynamic> map) {
    return RecipeCategory(
      id: map['idCategory'] as String,
      name: map['strCategory'] as String,
      imageUrl: map['strCategoryThumb'] as String,
    );
  }
}
