import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_bloc.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_state.dart';
import 'package:rick_and_morty/main.dart';

class AllCharactersList extends StatefulWidget {
  const AllCharactersList({
    super.key,
    required this.characters,
    required this.currentPage,
    required this.maxPage,
  });

  final List<CharacterEntity> characters;
  final ValueNotifier<int> currentPage;
  final int maxPage;

  @override
  State<AllCharactersList> createState() => _AllCharactersListState();
}

class _AllCharactersListState extends State<AllCharactersList> {
  final _scrollController = ScrollController();
  bool _isReadyToLoad = true;

  // int page = 1;
  // final _allCharactersBloc = di<AllCharactersBloc>();
  

  // @override
  // void initState() {
  //   _allCharactersBloc.add(FetchAllCharactersEvent(page: page));

  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _scrollController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllCharactersBloc, AllCharactersState>(
      listener: (BuildContext context, AllCharactersState state) {
        if (state.status == StateStatus.loaded) {
          _isReadyToLoad = true;
        }
      },
      child: NotificationListener(
        onNotification: (notification) {
          if (_scrollController.position.pixels >=
                  (_scrollController.position.maxScrollExtent) &&
              _isReadyToLoad &&
              widget.currentPage.value < widget.maxPage) {
            di<AllCharactersBloc>().add(
              FetchAllCharactersEvent(page: widget.currentPage.value),
            );
            widget.currentPage.value++;
           
            _isReadyToLoad = false;
          }
          return false;
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverFixedExtentList(
              itemExtent: 120,
              delegate: SliverChildBuilderDelegate(
                childCount: widget.characters.length,
                (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(
                              widget.characters[index].image ?? '',
                            ),
                          ),
                        ),
                      ),
                      AppDimens.mediumPadding.horizontalSizedBox,
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (widget.characters[index].status ?? '')
                                  .toUpperCase(),
                              style: AppTextStyles.s10w500.copyWith(
                                color: AppColors.characterStatusGreen,
                              ),
                            ),

                            Text(
                              widget.characters[index].name ?? '',
                              style: AppTextStyles.s16w500.copyWith(
                                color: AppColors.characterNameWhite,
                              ),
                            ),
                            Text(
                              widget.characters[index].species ?? '',
                              style: AppTextStyles.s12w400.copyWith(
                                color: AppColors.characterInfoGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
