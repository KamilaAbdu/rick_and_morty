import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';

abstract class AppTheme extends ChangeNotifier{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.mainDark,
    textTheme: TextTheme().copyWith(
      bodySmall: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodyLarge: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: AppColors.uiDarkGrey),
      labelMedium: TextStyle(color: AppColors.uiDarkGrey),
      labelLarge: TextStyle(color: AppColors.uiDarkGrey),
      displaySmall: TextStyle(color: Colors.white),
      displayMedium: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),

    )
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme().copyWith(
      bodySmall: TextStyle(color: AppColors.mainDark,),
      bodyMedium: TextStyle(color: AppColors.mainDark,),
      bodyLarge: TextStyle(color: AppColors.mainDark,),
      labelSmall: TextStyle(color: AppColors.mainDark,),
      labelMedium: TextStyle(color: AppColors.mainDark,),
      labelLarge: TextStyle(color: AppColors.mainDark,),
      displaySmall: TextStyle(color: AppColors.mainDark,),
      displayMedium: TextStyle(color: AppColors.mainDark,),
      displayLarge: TextStyle(color: AppColors.mainDark,),

    )
  );
}