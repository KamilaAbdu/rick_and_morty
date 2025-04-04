import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/provider/theme_provider.dart';
import 'package:rick_and_morty/core/service/auto_router.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/core/theme/app_theme.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_bloc.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required TextEditingController textFieldController,
    required AllCharactersBloc allCharactersBloc,
  }) : _textFieldController = textFieldController,
       _allCharactersBloc = allCharactersBloc;

  final TextEditingController _textFieldController;
  final AllCharactersBloc _allCharactersBloc;

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color:
            themeProvider.currentTheme == AppTheme.darkTheme
                ? AppColors.secondaryDark
                : AppColors.lightGrey,

        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textFieldController,
              style: AppTextStyles.s16w400.copyWith(
                color:
                    themeProvider.currentTheme == AppTheme.darkTheme
                        ? Colors.white
                        : AppColors.secondaryDark,
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  _allCharactersBloc.add(FetchAllCharactersEvent(page: 1));
                } else {
                  _allCharactersBloc.add(
                    SearchSingleCharacterEvent(name: value, page: 1),
                  );
                }
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, size: 24),
                prefixIconColor: AppColors.uiDarkGrey,
                hintText: context.lang.searchCharacters,
                hintStyle: AppTextStyles.s16w400.copyWith(
                  color: AppColors.uiDarkGrey,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 15,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            width: 1.5,
            height: 24,
            color: AppColors.uiDarkGrey,
            margin: EdgeInsets.symmetric(horizontal: 8),
          ),
          IconButton(
            onPressed: () {
              context.router.push(CharacterFilterRoute());
            },
            icon: Icon(Icons.filter_alt_outlined, size: 24),
            color: AppColors.uiDarkGrey,
          ),
        ],
      ),
    );
  }
}
