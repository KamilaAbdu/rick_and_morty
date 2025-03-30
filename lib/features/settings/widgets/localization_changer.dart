
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/assets/app_assets.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/provider/localization_provider.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';

class LocalizationChanger extends StatelessWidget {
  const LocalizationChanger({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationProvider = context.watch<LocalizationProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final currentLocale = localizationProvider.currentLocale.languageCode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.lang.changeLocale.toUpperCase(),
          style: AppTextStyles.s10w500.copyWith(
            color: AppColors.uiDarkGrey,
          ),
        ),
        AppDimens.largePadding.verticalSizedBox,
        Row(
          children: [
            SvgPicture.asset(
              AppAssets.languageIcon,
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
                  currentLocale == 'ru'
                      ? 'Русский'
                      : currentLocale == 'ky'
                          ? 'Кыргызча'
                          : 'English',
                  style: AppTextStyles.s16w400.copyWith(
                    color: themeProvider.currentTheme == AppTheme.darkTheme
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
              onPressed: () => _showLocaleDialog(context),
              icon: const Icon(Icons.arrow_forward_ios),
              color: AppColors.uiDarkGrey,
            ),
          ],
        ),
      ],
    );
  }

  void _showLocaleDialog(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    final localizationProvider = context.read<LocalizationProvider>();
    final currentLang = localizationProvider.currentLocale.languageCode;

    String selectedLocale = currentLang;

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
                      context.lang.changeLocale,
                      style: AppTextStyles.s20w500.copyWith(
                        color: themeProvider.currentTheme == AppTheme.darkTheme
                            ? Colors.white
                            : AppColors.mainDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...["ky", "ru", "en"].map((locale) => RadioListTile(
                          value: locale,
                          groupValue: selectedLocale,
                          onChanged: (value) {
                            setState(() => selectedLocale = value!);
                            localizationProvider.changeLocale(Locale(value!));
                          },
                          title: Text(
                            _getLangName(locale),
                            style: AppTextStyles.s16w400.copyWith(
                              color: themeProvider.currentTheme == AppTheme.darkTheme
                                  ? Colors.white
                                  : AppColors.mainDark,
                            ),
                          ),
                        )),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          context.lang.cancel,
                          style: AppTextStyles.s14w500.copyWith(
                            color: themeProvider.currentTheme == AppTheme.darkTheme
                                ? Colors.white
                                : AppColors.mainDark,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  String _getLangName(String locale) {
    switch (locale) {
      case 'ky':
        return 'Кыргызча';
      case 'ru':
        return 'Русский';
      default:
        return 'English';
    }
  }
}


