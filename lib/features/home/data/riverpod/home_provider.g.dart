// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentTabNotifierHash() =>
    r'c8cc6b72d1e851908402af8fca825d9a0375b3e4';

/// Notifier that holds the current tab.
///
/// Copied from [CurrentTabNotifier].
@ProviderFor(CurrentTabNotifier)
final currentTabNotifierProvider =
    AutoDisposeNotifierProvider<CurrentTabNotifier, TabItem>.internal(
  CurrentTabNotifier.new,
  name: r'currentTabNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentTabNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentTabNotifier = AutoDisposeNotifier<TabItem>;
String _$currentUserHash() => r'1886859de561b65fb79d775bdff2477f1e5db898';

/// See also [CurrentUser].
@ProviderFor(CurrentUser)
final currentUserProvider =
    AutoDisposeAsyncNotifierProvider<CurrentUser, UserEntity?>.internal(
  CurrentUser.new,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentUser = AutoDisposeAsyncNotifier<UserEntity?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
