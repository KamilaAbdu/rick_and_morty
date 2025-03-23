import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/core/service/auto_router.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_bloc.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_state.dart';
import 'package:rick_and_morty/main.dart';

class AllCharactersGrid extends StatefulWidget {
  const AllCharactersGrid({
    super.key,
    required this.characters,
    required this.currentPage,
    required this.maxPage,
    required this.searchController,
  });

  final List<CharacterEntity> characters;
  final ValueNotifier<int> currentPage;
  final int maxPage;
  final TextEditingController searchController;

  @override
  State<AllCharactersGrid> createState() => _AllCharactersGridState();
}

class _AllCharactersGridState extends State<AllCharactersGrid> {
  final _scrollController = ScrollController();
  bool _isReadyToLoad = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AllCharactersBloc, AllCharactersState>(
      listener: (context, state) {
        if (state.status == StateStatus.loaded) {
          _isReadyToLoad = true;
        }
      },
      child: NotificationListener(
        onNotification: (notification) {
          if (_scrollController.position.pixels >=
                  _scrollController.position.maxScrollExtent &&
              _isReadyToLoad &&
              widget.currentPage.value < widget.maxPage) {
            if (widget.searchController.text.isEmpty) {
              di<AllCharactersBloc>().add(
                FetchAllCharactersEvent(page: widget.currentPage.value),
              );
            } else {
              di<AllCharactersBloc>().add(
                SearchSingleCharacterEvent(
                  name: widget.searchController.text,
                  page: widget.currentPage.value,
                ),
              );
            }
            widget.currentPage.value++;
            _isReadyToLoad = false;
          }
          return false;
        },
        child: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: widget.characters.length,
          itemBuilder: (context, index) {
            final character = widget.characters[index];

            return GestureDetector(
              onTap: () {
                context.router.push(
                  CharacterDetailsRoute(entity: widget.characters[index]),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 122,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(character.image ?? ''),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    (character.status ?? '').toUpperCase(),
                    style: AppTextStyles.s10w500.copyWith(
                      color:
                          character.status == 'Alive'
                              ? AppColors.characterStatusGreen
                              : AppColors.characterStatusRed,
                    ),
                  ),

                  Text(
                    character.name ?? '',
                    style: AppTextStyles.s14w500.copyWith(
                     
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    character.species ?? '',
                    style: AppTextStyles.s12w400.copyWith(
                      color: AppColors.characterInfoGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
