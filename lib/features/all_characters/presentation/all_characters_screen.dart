import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/core/l10n/generated/l10n.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_bloc.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_state.dart';
import 'package:rick_and_morty/features/all_characters/presentation/widgets/all_characters_list.dart';
import 'package:rick_and_morty/main.dart';

@RoutePage()
class AllCharactersScreen extends StatelessWidget {
  const AllCharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _allCharactersBloc =
        di<AllCharactersBloc>()..add(FetchAllCharactersEvent());

    return Scaffold(
      appBar: AppBar(title: Text(L10ns.of(context).rickAndMorty)),
      body: BlocProvider.value(
        value: _allCharactersBloc,
        child: BlocBuilder<AllCharactersBloc, AllCharactersState>(
          builder: (context, state) {
            if (state.status == StateStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.status == StateStatus.loaded) {
              return AllCharactersList(characters: state.model?.results ?? []);
            } else {
              return Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
