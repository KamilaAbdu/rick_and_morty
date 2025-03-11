import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('en'); // Язык по умолчанию

  Locale get currentLocale => _currentLocale;

  void changeLocale(Locale newLocale) {
    if (_currentLocale == newLocale) return; // Если язык не изменился, не обновляем

    _currentLocale = newLocale;
    notifyListeners(); // Оповещаем виджеты об изменении
  }
}
