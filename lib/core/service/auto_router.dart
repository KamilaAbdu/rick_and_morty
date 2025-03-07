import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty/features/all_characters/presentation/all_characters_screen.dart';

part 'package:rick_and_morty/core/service/auto_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

 @override
 List<AutoRoute> get routes => [
   AutoRoute(page: AllCharactersRoute.page, initial: true),
 ];
}