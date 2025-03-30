// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

/// generated route for
/// [AllCharactersScreen]
class AllCharactersRoute extends PageRouteInfo<void> {
  const AllCharactersRoute({List<PageRouteInfo>? children})
    : super(AllCharactersRoute.name, initialChildren: children);

  static const String name = 'AllCharactersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AllCharactersScreen();
    },
  );
}

/// generated route for
/// [CharacterDetailsScreen]
class CharacterDetailsRoute extends PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    Key? key,
    required CharacterEntity entity,
    List<PageRouteInfo>? children,
  }) : super(
         CharacterDetailsRoute.name,
         args: CharacterDetailsRouteArgs(key: key, entity: entity),
         initialChildren: children,
       );

  static const String name = 'CharacterDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterDetailsRouteArgs>();
      return CharacterDetailsScreen(key: args.key, entity: args.entity);
    },
  );
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({this.key, required this.entity});

  final Key? key;

  final CharacterEntity entity;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{key: $key, entity: $entity}';
  }
}

/// generated route for
/// [CharacterFilterScreen]
class CharacterFilterRoute extends PageRouteInfo<void> {
  const CharacterFilterRoute({List<PageRouteInfo>? children})
    : super(CharacterFilterRoute.name, initialChildren: children);

  static const String name = 'CharacterFilterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CharacterFilterScreen();
    },
  );
}

/// generated route for
/// [EpisodesScreen]
class EpisodesRoute extends PageRouteInfo<void> {
  const EpisodesRoute({List<PageRouteInfo>? children})
    : super(EpisodesRoute.name, initialChildren: children);

  static const String name = 'EpisodesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EpisodesScreen();
    },
  );
}

/// generated route for
/// [LocationsScreen]
class LocationsRoute extends PageRouteInfo<void> {
  const LocationsRoute({List<PageRouteInfo>? children})
    : super(LocationsRoute.name, initialChildren: children);

  static const String name = 'LocationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LocationsScreen();
    },
  );
}

/// generated route for
/// [MainTabWrapperScreen]
class MainTabWrapperRoute extends PageRouteInfo<void> {
  const MainTabWrapperRoute({List<PageRouteInfo>? children})
    : super(MainTabWrapperRoute.name, initialChildren: children);

  static const String name = 'MainTabWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainTabWrapperScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}
