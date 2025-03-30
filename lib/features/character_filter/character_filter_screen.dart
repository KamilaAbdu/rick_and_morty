import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/provider/filter_provider.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';

class CharacterFilterScreen extends StatelessWidget {
  const CharacterFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = context.watch<FilterProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          context.lang.characterFilters,
          style: AppTextStyles.s20w500.copyWith(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              filterProvider.clearFilters();
              Navigator.pop(context); 
            },
            icon: Icon(Icons.filter_alt_off_outlined, color: Colors.redAccent),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(height: 16),
            Text(
              context.lang.filterCharacter.toUpperCase(),
              style: AppTextStyles.s10w500.copyWith(
                color: AppColors.uiDarkGrey,
              ),
            ),
            const SizedBox(height: 16),
            _buildSortSection(context, filterProvider),
            const SizedBox(height: 36),
            _divider(),
            const SizedBox(height: 36),
            _buildStatusSection(context, filterProvider),
            const SizedBox(height: 36),
            _buildGenderSection(context, filterProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildSortSection(BuildContext context, FilterProvider provider) {
    return Row(
      children: [
        Text(
          context.lang.filterCharacterByAlp,
          style: AppTextStyles.s16w400.copyWith(color: Colors.white),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => provider.setSortByAlphabet(true),
          icon: Icon(Icons.sort_by_alpha,
              color: provider.sortByAlphabet
                  ? AppColors.uiDarkBlue
                  : AppColors.uiDarkGrey),
        ),
        IconButton(
          onPressed: () => provider.setSortByAlphabet(false),
          icon: Icon(Icons.sort_by_alpha_rounded,
              color: !provider.sortByAlphabet
                  ? AppColors.uiDarkBlue
                  : AppColors.uiDarkGrey),
        ),
      ],
    );
  }

  Widget _buildStatusSection(BuildContext context, FilterProvider provider) {
    final statuses = {
      context.lang.characterStatusAlive: 'Alive',
      context.lang.characterStatusDead: 'Dead',
      context.lang.characterStatusNoInfo: 'unknown',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.lang.characterStatus.toUpperCase(),
          style: AppTextStyles.s10w500.copyWith(
            color: AppColors.uiDarkGrey,
          ),
        ),
        const SizedBox(height: 16),
        ...statuses.entries.map(
          (e) => CheckboxListTile(
            title: Text(e.key, style: TextStyle(color: Colors.white)),
            value: provider.selectedStatuses.contains(e.value),
            activeColor: AppColors.uiDarkBlue,
            onChanged: (_) => provider.toggleStatus(e.value),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderSection(BuildContext context, FilterProvider provider) {
    final genders = {
      context.lang.characterGenderMan: 'Male',
      context.lang.characterGenderWoman: 'Female',
      context.lang.characterNoGender: 'Genderless',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.lang.characterGender.toLowerCase(),
          style: AppTextStyles.s10w500.copyWith(
            color: AppColors.uiDarkGrey,
          ),
        ),
        const SizedBox(height: 16),
        ...genders.entries.map(
          (e) => CheckboxListTile(
            title: Text(e.key, style: TextStyle(color: Colors.white)),
            value: provider.selectedGenders.contains(e.value),
            activeColor: AppColors.uiDarkBlue,
            onChanged: (_) => provider.toggleGender(e.value),
          ),
        ),
      ],
    );
  }

  Widget _divider() => Container(
        height: 2,
        width: double.infinity,
        color: AppColors.secondaryDark,
      );
}

