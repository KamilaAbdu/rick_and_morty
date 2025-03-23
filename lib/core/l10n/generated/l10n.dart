// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10ns {
  L10ns();

  static L10ns? _current;

  static L10ns get current {
    assert(
      _current != null,
      'No instance of L10ns was loaded. Try to initialize the L10ns delegate before accessing L10ns.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10ns> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10ns();
      L10ns._current = instance;

      return instance;
    });
  }

  static L10ns of(BuildContext context) {
    final instance = L10ns.maybeOf(context);
    assert(
      instance != null,
      'No instance of L10ns present in the widget tree. Did you add L10ns.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static L10ns? maybeOf(BuildContext context) {
    return Localizations.of<L10ns>(context, L10ns);
  }

  /// `Rick and Morty`
  String get rickAndMorty {
    return Intl.message(
      'Rick and Morty',
      name: 'rickAndMorty',
      desc: '',
      args: [],
    );
  }

  /// `Total characters`
  String get allCharacters {
    return Intl.message(
      'Total characters',
      name: 'allCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Find a character`
  String get searchCharacters {
    return Intl.message(
      'Find a character',
      name: 'searchCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get characterGender {
    return Intl.message('Gender', name: 'characterGender', desc: '', args: []);
  }

  /// `Species`
  String get characterSpecies {
    return Intl.message(
      'Species',
      name: 'characterSpecies',
      desc: '',
      args: [],
    );
  }

  /// `Place of Birth`
  String get characterPlaceofBirth {
    return Intl.message(
      'Place of Birth',
      name: 'characterPlaceofBirth',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get characterLocation {
    return Intl.message(
      'Location',
      name: 'characterLocation',
      desc: '',
      args: [],
    );
  }

  /// `Episodes`
  String get characterEpisodes {
    return Intl.message(
      'Episodes',
      name: 'characterEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `All episodes`
  String get characterAllEpisodes {
    return Intl.message(
      'All episodes',
      name: 'characterAllEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `Episode`
  String get characterIncludedSeries {
    return Intl.message(
      'Episode',
      name: 'characterIncludedSeries',
      desc: '',
      args: [],
    );
  }

  /// `Characters`
  String get navigationBarCharacters {
    return Intl.message(
      'Characters',
      name: 'navigationBarCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Locations`
  String get navigationBarLocations {
    return Intl.message(
      'Locations',
      name: 'navigationBarLocations',
      desc: '',
      args: [],
    );
  }

  /// `Episodes`
  String get navigationBarEpisodes {
    return Intl.message(
      'Episodes',
      name: 'navigationBarEpisodes',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get navigationBarSettings {
    return Intl.message(
      'Settings',
      name: 'navigationBarSettings',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10ns> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10ns> load(Locale locale) => L10ns.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
