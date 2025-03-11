import 'package:rick_and_morty/base/domain/base_usecase.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/repository/all_characters_repository.dart';

class FetchAllCharactersUsecase extends BaseUsecase<AllCharactersEntity>{
final AllCharacterRepository _repository;

  FetchAllCharactersUsecase({required AllCharacterRepository repository}) : _repository = repository;

  @override
  Future<AllCharactersEntity> execute() {
    return _repository.fetchAllCharacters();
  }}