import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_bloc.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_state.dart';
import 'package:rick_and_morty/features/all_characters/presentation/widgets/all_characters_grid.dart';
import 'package:rick_and_morty/features/all_characters/presentation/widgets/all_characters_list.dart';
import 'package:rick_and_morty/features/all_characters/presentation/widgets/search_character_text_field.dart';
import 'package:rick_and_morty/main.dart';

@RoutePage()
class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key});

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  final _textFieldController = TextEditingController();
  final _allCharactersBloc =
      di<AllCharactersBloc>()..add(FetchAllCharactersEvent(page: 1));
  final _currentPage = ValueNotifier<int>(2);
  final _searchCurrentPage = ValueNotifier<int>(2);
  final ValueNotifier<bool> _isGrid = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.mediumPadding,
          ),
          child: Column(
            children: [
              SearchTextField(
                textFieldController: _textFieldController,
                allCharactersBloc: _allCharactersBloc,
              ),
              AppDimens.mediumPadding.verticalSizedBox,
              Expanded(
                child: BlocProvider.value(
                  value: _allCharactersBloc,
                  child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
                    builder: (context, state) {
                      if (state.status == StateStatus.loaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${context.lang.allCharacters}: ${state.model?.info?.count ?? 0}'
                                      .toUpperCase(),
                                  style: AppTextStyles.s10w500.copyWith(
                                    color: AppColors.uiDarkGrey,
                                  ),
                                ),
                                const Spacer(),
                                ValueListenableBuilder<bool>(
                                  valueListenable: _isGrid,
                                  builder: (context, isGrid, child) {
                                    return IconButton(
                                      icon: Icon(
                                        isGrid ? Icons.list : Icons.grid_view,
                                        color: AppColors.uiDarkGrey,
                                      ),
                                      onPressed: () {
                                        _isGrid.value = !_isGrid.value;
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                            AppDimens.smallPadding.verticalSizedBox,
                            Expanded(
                              child: ValueListenableBuilder<bool>(
                                valueListenable: _isGrid,
                                builder: (context, isGrid, child) {
                                  return isGrid
                                      ? AllCharactersGrid(
                                        characters: state.model?.results ?? [],
                                        currentPage:
                                            _textFieldController.text.isEmpty
                                                ? _currentPage
                                                : _searchCurrentPage,
                                        maxPage: state.model?.info?.pages ?? 0,
                                        searchController: _textFieldController,
                                      )
                                      : AllCharactersList(
                                        characters: state.model?.results ?? [],
                                        currentPage:
                                            _textFieldController.text.isEmpty
                                                ? _currentPage
                                                : _searchCurrentPage,
                                        maxPage: state.model?.info?.pages ?? 0,
                                        searchController: _textFieldController,
                                      );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(child: Text('No data'));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
