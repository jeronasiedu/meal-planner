import 'package:get_storage/get_storage.dart';
import 'package:mealplanner/entities/complete_recipe.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarks_provider.g.dart';

@riverpod
class Bookmarks extends _$Bookmarks {
  final _storage = GetStorage();

  @override
  FutureOr<List<CompleteRecipe>> build() {
    final bookmarks = _storage.getValues() ?? [];
    return List.from(bookmarks).map((e) => CompleteRecipe.fromBookmark(e)).toList();
  }

  void add(CompleteRecipe meal) {
    _storage.write(meal.id, meal.toMap());
    ref.invalidateSelf();
  }

  void remove(String id) {
    _storage.remove(id);
    ref.invalidateSelf();
  }

  bool isBookmarked(String id) {
    return _storage.hasData(id);
  }
}
