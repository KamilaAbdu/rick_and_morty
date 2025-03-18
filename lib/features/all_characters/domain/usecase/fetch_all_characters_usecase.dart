import 'package:rick_and_morty/base/domain/base_params.dart';
import 'package:rick_and_morty/base/domain/base_usecase.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/repository/all_characters_repository.dart';

class FetchAllCharactersUsecase extends BaseUsecase<AllCharactersEntity, FetchAllCharactersParams> {
  final AllCharacterRepository _repository;

  FetchAllCharactersUsecase({required AllCharacterRepository repository})
    : _repository = repository;

  @override
  Future<AllCharactersEntity> execute({
    required FetchAllCharactersParams params,
  }) {
    return _repository.fetchAllCharacters(params: params);
  }
}

class FetchAllCharactersParams extends BaseParams {
  final int page;

  FetchAllCharactersParams({required this.page});

  @override
  Map<String, dynamic> toJson() {
    return {'page': page};
  }
}
