class Ingredient {
  final String name;
  final String measure;

  final String imageUrl;

  const Ingredient({
    required this.name,
    required this.measure,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'measure': measure,
      'imageUrl': imageUrl,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) {
    return Ingredient(
      name: map['name'] as String,
      measure: map['measure'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
