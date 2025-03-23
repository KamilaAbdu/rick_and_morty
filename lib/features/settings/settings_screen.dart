import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';

import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';
import 'package:rick_and_morty/features/settings/widgets/about_app.dart';
import 'package:rick_and_morty/features/settings/widgets/theme_change.dart';
import 'package:rick_and_morty/features/settings/widgets/user_info.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.lang.navigationBarSettings,
          style: AppTextStyles.s20w500.copyWith(
            color:
                themeProvider.currentTheme == AppTheme.darkTheme
                    ? Colors.white
                    : AppColors.mainDark,
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.largePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfo(),
            SizedBox(height: 36),
            ThemeChange(),
            SizedBox(height: 36),
            AboutApp(),
          ],
        ),
      ),
    );
  }
}
