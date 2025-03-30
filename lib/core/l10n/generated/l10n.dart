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

  /// `Search character`
  String get searchCharacters {
    return Intl.message(
      'Search character',
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

  /// `Status`
  String get characterStatus {
    return Intl.message('Status', name: 'characterStatus', desc: '', args: []);
  }

  /// `Place of birth`
  String get characterPlaceofBirth {
    return Intl.message(
      'Place of birth',
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

  /// `Series`
  String get characterIncludedSeries {
    return Intl.message(
      'Series',
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

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Edit profile`
  String get editUserInformation {
    return Intl.message(
      'Edit profile',
      name: 'editUserInformation',
      desc: '',
      args: [],
    );
  }

  /// `Change photo`
  String get changeUserAvatar {
    return Intl.message(
      'Change photo',
      name: 'changeUserAvatar',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get userProfile {
    return Intl.message('Profile', name: 'userProfile', desc: '', args: []);
  }

  /// `Change full name`
  String get changeUserName {
    return Intl.message(
      'Change full name',
      name: 'changeUserName',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get userName {
    return Intl.message('First name', name: 'userName', desc: '', args: []);
  }

  /// `Last name`
  String get userLastName {
    return Intl.message('Last name', name: 'userLastName', desc: '', args: []);
  }

  /// `Middle name`
  String get userPatronic {
    return Intl.message(
      'Middle name',
      name: 'userPatronic',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Appearance`
  String get changeTheme {
    return Intl.message('Appearance', name: 'changeTheme', desc: '', args: []);
  }

  /// `Dark theme`
  String get darkTheme {
    return Intl.message('Dark theme', name: 'darkTheme', desc: '', args: []);
  }

  /// `Light theme`
  String get lightTheme {
    return Intl.message('Light theme', name: 'lightTheme', desc: '', args: []);
  }

  /// `Enabled`
  String get activeTheme {
    return Intl.message('Enabled', name: 'activeTheme', desc: '', args: []);
  }

  /// `Disabled`
  String get disabledTheme {
    return Intl.message('Disabled', name: 'disabledTheme', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `About the app`
  String get aboutApp {
    return Intl.message('About the app', name: 'aboutApp', desc: '', args: []);
  }

  /// `Zigerians trap Jerry and Rick in a simulation to learn the secret of concentrated dark matter.`
  String get appDescription {
    return Intl.message(
      'Zigerians trap Jerry and Rick in a simulation to learn the secret of concentrated dark matter.',
      name: 'appDescription',
      desc: '',
      args: [],
    );
  }

  /// `App version`
  String get appVersion {
    return Intl.message('App version', name: 'appVersion', desc: '', args: []);
  }

  /// `Search results`
  String get characterSearchResults {
    return Intl.message(
      'Search results',
      name: 'characterSearchResults',
      desc: '',
      args: [],
    );
  }

  /// `No character with that name found`
  String get noCharacterSearchResults {
    return Intl.message(
      'No character with that name found',
      name: 'noCharacterSearchResults',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get characterFilters {
    return Intl.message(
      'Filters',
      name: 'characterFilters',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get filterCharacter {
    return Intl.message('Sort', name: 'filterCharacter', desc: '', args: []);
  }

  /// `Alphabetically`
  String get filterCharacterByAlp {
    return Intl.message(
      'Alphabetically',
      name: 'filterCharacterByAlp',
      desc: '',
      args: [],
    );
  }

  /// `Alive`
  String get characterStatusAlive {
    return Intl.message(
      'Alive',
      name: 'characterStatusAlive',
      desc: '',
      args: [],
    );
  }

  /// `Dead`
  String get characterStatusDead {
    return Intl.message(
      'Dead',
      name: 'characterStatusDead',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get characterStatusNoInfo {
    return Intl.message(
      'Unknown',
      name: 'characterStatusNoInfo',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get characterGenderMan {
    return Intl.message('Male', name: 'characterGenderMan', desc: '', args: []);
  }

  /// `Female`
  String get characterGenderWoman {
    return Intl.message(
      'Female',
      name: 'characterGenderWoman',
      desc: '',
      args: [],
    );
  }

  /// `Genderless`
  String get characterNoGender {
    return Intl.message(
      'Genderless',
      name: 'characterNoGender',
      desc: '',
      args: [],
    );
  }

  /// `No results found with these filters`
  String get filterCharacterNoResults {
    return Intl.message(
      'No results found with these filters',
      name: 'filterCharacterNoResults',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get changeLocale {
    return Intl.message('Language', name: 'changeLocale', desc: '', args: []);
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
