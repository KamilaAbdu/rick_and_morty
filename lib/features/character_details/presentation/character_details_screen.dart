import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/character_details/presentation/widgets/character_background_image.dart';
import 'package:rick_and_morty/features/character_details/presentation/widgets/circle_character_avatar.dart';
import 'package:rick_and_morty/features/character_details/presentation/widgets/detailed_character_info.dart';
import 'package:rick_and_morty/features/character_details/presentation/widgets/main_character_info.dart';

@RoutePage()
class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.entity});
  final CharacterEntity entity;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final imageSize = mq.width < 500 ? mq.width / 2.1 : mq.width / 3.1;

    return Scaffold(
      backgroundColor: AppColors.mainDark,

      body: Stack(
        clipBehavior: Clip.none,
        children: [
          characterBackgroundImage(entity.image, context),

          Positioned(
            top: mq.height * 0.05,
            left: 16,
            child: const BackButton(color: Colors.white),
          ),

          Positioned(
            top: mq.height / 7,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleCharacterAvatar(imageSize: imageSize, entity: entity),
                AppDimens.largePadding.verticalSizedBox,
                MainCharacterInfo(entity: entity),
                AppDimens.largePadding.verticalSizedBox,
                DetailedCharacterInfo(entity: entity),
                AppDimens.largePadding.verticalSizedBox,
                Container(
                  width: double.infinity,
                  height: 2,
                  decoration: BoxDecoration(color: AppColors.secondaryDark),
                ),
                AppDimens.largePadding.verticalSizedBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.mediumPadding),
                  child: Row(
                    children: [
                      Text(
                        context.lang.characterEpisodes,
                        style: AppTextStyles.s20w500.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        context.lang.characterAllEpisodes,
                        style: AppTextStyles.s12w400.copyWith(
                          color: AppColors.uiDarkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
