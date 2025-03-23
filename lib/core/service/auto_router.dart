import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/presentation/all_characters_screen.dart';
import 'package:rick_and_morty/features/character_details/presentation/character_details_screen.dart';
import 'package:rick_and_morty/features/episodes/episodes_screen.dart';
import 'package:rick_and_morty/features/locations/locations_screen.dart';
import 'package:rick_and_morty/features/main/main_tab_wrapper_screen.dart';
import 'package:rick_and_morty/features/settings/settings_screen.dart';

part 'package:rick_and_morty/core/service/auto_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

 @override
 List<AutoRoute> get routes => [
   AutoRoute(
          page: MainTabWrapperRoute.page,
          initial: true,
          children: [
            AutoRoute(page: AllCharactersRoute.page, path: 'characters'),
            AutoRoute(page: LocationsRoute.page, path: 'locations'),
            AutoRoute(page: EpisodesRoute.page, path: 'episodes'),
            AutoRoute(page: SettingsRoute.page, path: 'settings'),
          ],
        ),
        AutoRoute(page: CharacterDetailsRoute.page),
      ];
}