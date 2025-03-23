import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/assets/app_assets.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';

import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';

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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.largePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(height: 80, width: 80, child: CircleAvatar()),
                AppDimens.mediumPadding.horizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Oleg Belotserkovsky', style: AppTextStyles.s16w400),
                    AppDimens.smallPadding.verticalSizedBox,
                    Text(
                      'Morty',
                      style: AppTextStyles.s14w400.copyWith(
                        color: AppColors.uiDarkGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                  elevation: WidgetStateProperty.all(0),
                  side: WidgetStateProperty.all(
                    BorderSide(color: AppColors.uiDarkBlue),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text(
                  'Edit',
                  style: AppTextStyles.s16w400.copyWith(
                    color: AppColors.uiDarkBlue,
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
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
              context.lang.changeTheme.toUpperCase(),
              style: AppTextStyles.s10w500.copyWith(
                color: AppColors.uiDarkGrey,
              ),
            ),
            AppDimens.largePadding.verticalSizedBox,
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.themeIcon,
                  height: 36,
                  width: 36,
                  colorFilter: ColorFilter.mode(
                    themeProvider.currentTheme == AppTheme.darkTheme
                        ? Colors.white
                        : AppColors.mainDark,
                    BlendMode.srcIn,
                  ),
                ),
                AppDimens.mediumPadding.horizontalSizedBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.lang.darkTheme,
                      style: AppTextStyles.s16w400.copyWith(
                        color:
                            themeProvider.currentTheme == AppTheme.darkTheme
                                ? Colors.white
                                : AppColors.mainDark,
                      ),
                    ),
                    Text(
                      context.lang.activeTheme,
                      style: AppTextStyles.s16w400.copyWith(
                        color: AppColors.uiDarkGrey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
