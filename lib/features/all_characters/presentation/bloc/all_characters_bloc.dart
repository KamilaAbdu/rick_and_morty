import 'package:rick_and_morty/base/presentation/base_bloc.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/search_single_character_usecase.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_state.dart';

class AllCharactersBloc
    extends BaseBloc<AllCharactersEvent, AllCharactersState> {
  final FetchAllCharactersUsecase _allCharactersUsecase;
  final SearchSingleCharacterUsecase _searchSingleCharacterUsecase;
  // int page = 0;
  List<CharacterEntity> allCharacters = [];
  List<CharacterEntity> searchList = [];


  AllCharactersBloc({
    required FetchAllCharactersUsecase fetchCharactersUsecase,
    required SearchSingleCharacterUsecase searchSingleCharacterUsecase,
  }) : _allCharactersUsecase = fetchCharactersUsecase,
       _searchSingleCharacterUsecase = searchSingleCharacterUsecase,

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
    on<SearchSingleCharacterEvent>((event, emit) async {
      try {
        final result = await _searchSingleCharacterUsecase.execute(
          params: SearchSingleCharacterParams(
            name: event.name,
            status: event.status,
            species: event.species,
            type: event.type,
            gender: event.gender,
            page: event.page,
          ),
        );
        searchList.addAll(result.results ?? []);
        emit(
          AllCharactersState(
            status: StateStatus.loaded,
            model: AllCharactersEntity(
              info: result.info,
              results: searchList,
            ),
          ),
        );
      } catch (e) {
        emit(AllCharactersState(status: StateStatus.error));
      }
    });
  }
}
