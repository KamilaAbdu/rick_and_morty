import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/core/extensions/app_dimens_extension.dart';
import 'package:rick_and_morty/core/extensions/context_extension.dart';
import 'package:rick_and_morty/core/l10n/generated/l10n.dart';
import 'package:rick_and_morty/core/theme/app_colors.dart';
import 'package:rick_and_morty/core/theme/app_dimens.dart';
import 'package:rick_and_morty/core/theme/app_text_styles.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_bloc.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_state.dart';
import 'package:rick_and_morty/features/all_characters/presentation/widgets/all_characters_list.dart';
import 'package:rick_and_morty/main.dart';

@RoutePage()
class AllCharactersScreen extends StatefulWidget {
  const AllCharactersScreen({super.key});

  @override
  State<AllCharactersScreen> createState() => _AllCharactersScreenState();
}

class _AllCharactersScreenState extends State<AllCharactersScreen> {
  final _allCharactersBloc =
      di<AllCharactersBloc>()..add(FetchAllCharactersEvent(page: 1));
  final _currentPage = ValueNotifier<int>(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDark,
      appBar: AppBar(
        title: Text(L10ns.of(context).rickAndMorty),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocProvider.value(
        value: _allCharactersBloc,
        child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
          builder: (context, state) {
            if (state.status == StateStatus.loaded) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.mediumPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.lang.allCharacters}: ${state.model?.info?.count ?? 0}',
                      style: AppTextStyles.s10w500.copyWith(
                        color: AppColors.uiDarkGrey,
                      ),
                    ),
                    AppDimens.smallPadding.verticalSizedBox,
                    Expanded(
                      child: AllCharactersList(
                        characters: state.model?.results ?? [],
                        currentPage: _currentPage,
                        maxPage: state.model?.info?.pages ?? 0,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
