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

class ThemeChange extends StatelessWidget {
  const ThemeChange({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                IconButton(
                  onPressed: () {
                    _showThemeDialog(context);
                  },
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
      ],
    );
  }
}


void _showThemeDialog(BuildContext context) {
  final themeProvider = context.read<ThemeProvider>();
  int selectedThemeIndex = themeProvider.isDark ? 1 : 0;

  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.lang.darkTheme,
                    style: AppTextStyles.s20w500.copyWith(
                      color:
                          themeProvider.currentTheme == AppTheme.darkTheme
                              ? Colors.white
                              : AppColors.mainDark,
                    ),
                  ),
                  const SizedBox(height: 16),
                  RadioListTile<int>(
                    value: 0,
                    groupValue: selectedThemeIndex,
                    activeColor: Colors.cyanAccent,
                    onChanged: (value) {
                      setState(() {
                        selectedThemeIndex = value!;
                      });
                      themeProvider.toggleTheme(false);
                    },
                    title: Text(
                      context.lang.disabledTheme,
                      style: AppTextStyles.s16w400.copyWith(
                        color:
                            themeProvider.currentTheme == AppTheme.darkTheme
                                ? Colors.white
                                : AppColors.mainDark,
                      ),
                    ),
                  ),
                  RadioListTile<int>(
                    value: 1,
                    groupValue: selectedThemeIndex,
                    activeColor: Colors.cyanAccent,
                    onChanged: (value) {
                      setState(() {
                        selectedThemeIndex = value!;
                      });
                      themeProvider.toggleTheme(true);
                    },
                    title: Text(
                      context.lang.activeTheme,
                      style: AppTextStyles.s16w400.copyWith(
                        color:
                            themeProvider.currentTheme == AppTheme.darkTheme
                                ? Colors.white
                                : AppColors.mainDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        context.lang.cancel,
                        style: AppTextStyles.s14w500.copyWith(
                          color:
                              themeProvider.currentTheme == AppTheme.darkTheme
                                  ? Colors.white
                                  : AppColors.mainDark,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
