import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/assets/app_assets.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';

@RoutePage()
class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Episodes',
          style: AppTextStyles.s34w400.copyWith(
            color: AppColors.uiDarkGrey,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 150,
          child: Column(
            children: [
              AppDimens.largePadding.verticalSizedBox,
              Image.asset(AppAssets.noData),
              AppDimens.smallPadding.verticalSizedBox,
              Text(
                'No data',
                style: AppTextStyles.s20w500.copyWith(
                  color: AppColors.uiDarkGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
