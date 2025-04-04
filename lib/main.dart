import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/l10n/generated/l10n.dart';
import 'package:rick_and_morty/core/provider/filter_provider.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/service/auto_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rick_and_morty/core/service/di.dart' as get_it;
import 'package:rick_and_morty/core/provider/localization_provider.dart';

final di = GetIt.instance;

void main() {
  get_it.setup(di: di);
  runApp(RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalizationProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),

      ],
      child: Consumer2<LocalizationProvider, ThemeProvider>(
        builder: (context, localizationProvider, themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: localizationProvider.currentLocale,
            theme: context.watch<ThemeProvider>().currentTheme,
            localizationsDelegates: const [
              L10ns.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('ky'), Locale('en'), Locale('ru')],
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
