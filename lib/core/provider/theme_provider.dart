import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData currentTheme = AppTheme.darkTheme;
}