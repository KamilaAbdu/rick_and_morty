import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';

class MainCharacterInfo extends StatelessWidget {
  const MainCharacterInfo({super.key, required this.entity});

  final CharacterEntity entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            entity.name ?? '',
            style: AppTextStyles.s34w400.copyWith(
             
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        AppDimens.smallPadding.verticalSizedBox,

        Text(
          (entity.status ?? '').toUpperCase(),
          style: AppTextStyles.s10w500.copyWith(
            color:
                entity.status == 'Alive'
                    ? AppColors.characterStatusGreen
                    : AppColors.characterStatusRed,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
