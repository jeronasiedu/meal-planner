// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_by_category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$recipesByCategoryHash() => r'58a6e31e0a17ac18e1d802f7ebea9cd678095c55';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [recipesByCategory].
@ProviderFor(recipesByCategory)
const recipesByCategoryProvider = RecipesByCategoryFamily();

/// See also [recipesByCategory].
class RecipesByCategoryFamily extends Family<AsyncValue<List<BasicRecipe>>> {
  /// See also [recipesByCategory].
  const RecipesByCategoryFamily();

  /// See also [recipesByCategory].
  RecipesByCategoryProvider call(
    String category,
  ) {
    return RecipesByCategoryProvider(
      category,
    );
  }

  @override
  RecipesByCategoryProvider getProviderOverride(
    covariant RecipesByCategoryProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'recipesByCategoryProvider';
}

/// See also [recipesByCategory].
class RecipesByCategoryProvider
    extends AutoDisposeFutureProvider<List<BasicRecipe>> {
  /// See also [recipesByCategory].
  RecipesByCategoryProvider(
    String category,
  ) : this._internal(
          (ref) => recipesByCategory(
            ref as RecipesByCategoryRef,
            category,
          ),
          from: recipesByCategoryProvider,
          name: r'recipesByCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$recipesByCategoryHash,
          dependencies: RecipesByCategoryFamily._dependencies,
          allTransitiveDependencies:
              RecipesByCategoryFamily._allTransitiveDependencies,
          category: category,
        );

  RecipesByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    FutureOr<List<BasicRecipe>> Function(RecipesByCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RecipesByCategoryProvider._internal(
        (ref) => create(ref as RecipesByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<BasicRecipe>> createElement() {
    return _RecipesByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RecipesByCategoryProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RecipesByCategoryRef on AutoDisposeFutureProviderRef<List<BasicRecipe>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _RecipesByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<List<BasicRecipe>>
    with RecipesByCategoryRef {
  _RecipesByCategoryProviderElement(super.provider);

  @override
  String get category => (origin as RecipesByCategoryProvider).category;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
