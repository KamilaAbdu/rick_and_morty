import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en'); 

  Locale get currentLocale => _currentLocale;

  void changeLocale(Locale newLocale) {
    if (_currentLocale == newLocale) return; 

    _currentLocale = newLocale;
    notifyListeners(); 
  }
}
