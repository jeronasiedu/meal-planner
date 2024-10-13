// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_recipes_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomRecipesHash() => r'b3fcf4072e68f0af63fd2e7e6352dd768487a3a1';

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

/// See also [randomRecipes].
@ProviderFor(randomRecipes)
const randomRecipesProvider = RandomRecipesFamily();

/// See also [randomRecipes].
class RandomRecipesFamily extends Family<AsyncValue<List<CompleteRecipe>>> {
  /// See also [randomRecipes].
  const RandomRecipesFamily();

  /// See also [randomRecipes].
  RandomRecipesProvider call([
    int limit = 10,
  ]) {
    return RandomRecipesProvider(
      limit,
    );
  }

  @override
  RandomRecipesProvider getProviderOverride(
    covariant RandomRecipesProvider provider,
  ) {
    return call(
      provider.limit,
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
  String? get name => r'randomRecipesProvider';
}

/// See also [randomRecipes].
class RandomRecipesProvider extends FutureProvider<List<CompleteRecipe>> {
  /// See also [randomRecipes].
  RandomRecipesProvider([
    int limit = 10,
  ]) : this._internal(
          (ref) => randomRecipes(
            ref as RandomRecipesRef,
            limit,
          ),
          from: randomRecipesProvider,
          name: r'randomRecipesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$randomRecipesHash,
          dependencies: RandomRecipesFamily._dependencies,
          allTransitiveDependencies:
              RandomRecipesFamily._allTransitiveDependencies,
          limit: limit,
        );

  RandomRecipesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
  }) : super.internal();

  final int limit;

  @override
  Override overrideWith(
    FutureOr<List<CompleteRecipe>> Function(RandomRecipesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RandomRecipesProvider._internal(
        (ref) => create(ref as RandomRecipesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
      ),
    );
  }

  @override
  FutureProviderElement<List<CompleteRecipe>> createElement() {
    return _RandomRecipesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomRecipesProvider && other.limit == limit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RandomRecipesRef on FutureProviderRef<List<CompleteRecipe>> {
  /// The parameter `limit` of this provider.
  int get limit;
}

class _RandomRecipesProviderElement
    extends FutureProviderElement<List<CompleteRecipe>> with RandomRecipesRef {
  _RandomRecipesProviderElement(super.provider);

  @override
  int get limit => (origin as RandomRecipesProvider).limit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
