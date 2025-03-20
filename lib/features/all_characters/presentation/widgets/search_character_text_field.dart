import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
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
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondaryDark,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textFieldController,
              style: AppTextStyles.s16w400.copyWith(
                color: AppColors.characterNameWhite,
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
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined, size: 24),
            color: AppColors.uiDarkGrey,
          ),
        ],
      ),
    );
  }
}
