import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Container(
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(
            color:
                themeProvider.currentTheme == AppTheme.darkTheme
                    ? AppColors.secondaryDark
                    : AppColors.lightGrey,
          ),
        ),
        SizedBox(height: 36),
        Text(
          context.lang.aboutApp.toUpperCase(),
          style: AppTextStyles.s10w500.copyWith(color: AppColors.uiDarkGrey),
        ),
        AppDimens.largePadding.verticalSizedBox,
        Text(
          context.lang.appDescription,
          style: AppTextStyles.s14w400.copyWith(
            color:
                themeProvider.currentTheme == AppTheme.darkTheme
                    ? AppColors.characterNameWhite
                    : AppColors.mainDark,
          ),
        ),
        SizedBox(height: 36),
        Container(
          width: double.infinity,
          height: 2,
          decoration: BoxDecoration(
            color:
                themeProvider.currentTheme == AppTheme.darkTheme
                    ? AppColors.secondaryDark
                    : AppColors.lightGrey,
          ),
        ),
        SizedBox(height: 36),

        Text(
          context.lang.appVersion.toUpperCase(),
          style: AppTextStyles.s10w500.copyWith(color: AppColors.uiDarkGrey),
        ),
        AppDimens.largePadding.verticalSizedBox,
        Text(
          'Rick & Morty  v1.0.0',
          style: AppTextStyles.s14w400.copyWith(
            color:
                themeProvider.currentTheme == AppTheme.darkTheme
                    ? AppColors.characterNameWhite
                    : AppColors.mainDark,
          ),
        ),
      ],
    );
  }
}
