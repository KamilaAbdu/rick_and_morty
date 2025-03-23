import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';

class DetailedCharacterInfo extends StatelessWidget {
  const DetailedCharacterInfo({
    super.key,
    required this.entity,
  });

  final CharacterEntity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.mediumPadding,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.lang.characterGender,
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.uiDarkGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entity.gender ?? '',
                    style: AppTextStyles.s14w400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 120),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.lang.characterSpecies,
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.uiDarkGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entity.species ?? '',
                    style: AppTextStyles.s14w400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          AppDimens.mediumPadding.verticalSizedBox,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.lang.characterPlaceofBirth,
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.uiDarkGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entity.origin?.name ?? '',
                    style: AppTextStyles.s14w400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          AppDimens.mediumPadding.verticalSizedBox,
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.lang.characterLocation,
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.uiDarkGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entity.location?.name ?? '',
                    style: AppTextStyles.s14w400.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
