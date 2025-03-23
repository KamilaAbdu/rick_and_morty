import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';

class CircleCharacterAvatar extends StatelessWidget {
  const CircleCharacterAvatar({
    super.key,
    required this.imageSize,
    required this.entity,
  });

  final double imageSize;
  final CharacterEntity entity;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();

    return Container(
      height: imageSize,
      width: imageSize,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            themeProvider.currentTheme == AppTheme.darkTheme
                ? AppColors.secondaryDark
                : Colors.white,
      ),
      child: CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(entity.image ?? ''),
      ),
    );
  }
}
