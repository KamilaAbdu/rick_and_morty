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
