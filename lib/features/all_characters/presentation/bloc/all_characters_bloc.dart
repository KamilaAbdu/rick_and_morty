import 'package:rick_and_morty/base/presentation/base_bloc.dart';
import 'package:rick_and_morty/base/presentation/base_state.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_event.dart';

class AllCharactersBloc
    extends BaseBloc<AllCharactersEvent, BaseState<AllCharactersEntity>> {
  final FetchAllCharactersUsecase _allCharactersUsecase;

  AllCharactersBloc({required FetchAllCharactersUsecase fetchCharactersUsecase})
    : _allCharactersUsecase = fetchCharactersUsecase,
      super(
        BaseState<AllCharactersEntity>(
          model: AllCharactersEntity.empty(),
          status: StateStatus.init,
        ),
      ) {
    on<FetchAllCharactersEvent>((event, emit) => null);
  }
}
