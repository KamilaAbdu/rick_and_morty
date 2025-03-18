import 'package:rick_and_morty/base/presentation/base_bloc.dart';
import 'package:rick_and_morty/base/presentation/base_state.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_state.dart';

class AllCharactersBloc
    extends BaseBloc<AllCharactersEvent, AllCharactersState> {
  final FetchAllCharactersUsecase _allCharactersUsecase;
  // int page = 0;
  List<CharacterEntity> allCharacters = [];

  AllCharactersBloc({required FetchAllCharactersUsecase fetchCharactersUsecase})
    : _allCharactersUsecase = fetchCharactersUsecase,
      super(
        AllCharactersState(
          model: AllCharactersEntity.empty(),
          status: StateStatus.init,
        ),
      ) {
    on<FetchAllCharactersEvent>((event, emit) async {
      //emit(AllCharactersState(status: StateStatus.loading));
      try {
        final result = await _allCharactersUsecase.execute(
          params: FetchAllCharactersParams(page: event.page),
        );
        allCharacters.addAll(result.results ?? []);

        emit(
          AllCharactersState(
            status: StateStatus.loaded,
            model: AllCharactersEntity(
              info: result.info,
              results: allCharacters,
            ),
          ),
        );
      } catch (e) {
        emit(AllCharactersState(status: StateStatus.error));
      }
    });
  }
}
