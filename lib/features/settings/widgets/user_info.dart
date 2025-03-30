import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Column(
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            child: Text(
              context.lang.edit,
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
      ],
    );
  }
}
