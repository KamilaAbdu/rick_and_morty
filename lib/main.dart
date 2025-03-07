import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/service/auto_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rick_and_morty/core/service/di.dart' as get_it;

final di = GetIt.instance;

void main() {
  get_it.setup(di:di);
  runApp(RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('ky'), 
    Locale('en'), 
    Locale('ru'), 
  ],
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
