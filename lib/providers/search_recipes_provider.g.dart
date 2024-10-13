// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_recipes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchRecipesHash() => r'58f49ed2960447ad0865d6c993e45161e356e338';

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

/// See also [searchRecipes].
@ProviderFor(searchRecipes)
const searchRecipesProvider = SearchRecipesFamily();

/// See also [searchRecipes].
class SearchRecipesFamily extends Family<AsyncValue<List<CompleteRecipe>>> {
  /// See also [searchRecipes].
  const SearchRecipesFamily();

  /// See also [searchRecipes].
  SearchRecipesProvider call(
    String query,
  ) {
    return SearchRecipesProvider(
      query,
    );
  }

  @override
  SearchRecipesProvider getProviderOverride(
    covariant SearchRecipesProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'searchRecipesProvider';
}

/// See also [searchRecipes].
class SearchRecipesProvider
    extends AutoDisposeFutureProvider<List<CompleteRecipe>> {
  /// See also [searchRecipes].
  SearchRecipesProvider(
    String query,
  ) : this._internal(
          (ref) => searchRecipes(
            ref as SearchRecipesRef,
            query,
          ),
          from: searchRecipesProvider,
          name: r'searchRecipesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchRecipesHash,
          dependencies: SearchRecipesFamily._dependencies,
          allTransitiveDependencies:
              SearchRecipesFamily._allTransitiveDependencies,
          query: query,
        );

  SearchRecipesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<CompleteRecipe>> Function(SearchRecipesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchRecipesProvider._internal(
        (ref) => create(ref as SearchRecipesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CompleteRecipe>> createElement() {
    return _SearchRecipesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchRecipesProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchRecipesRef on AutoDisposeFutureProviderRef<List<CompleteRecipe>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchRecipesProviderElement
    extends AutoDisposeFutureProviderElement<List<CompleteRecipe>>
    with SearchRecipesRef {
  _SearchRecipesProviderElement(super.provider);

  @override
  String get query => (origin as SearchRecipesProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
