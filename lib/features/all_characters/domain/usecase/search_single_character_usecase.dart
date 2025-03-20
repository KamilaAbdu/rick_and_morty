import 'package:rick_and_morty/base/domain/base_params.dart';
import 'package:rick_and_morty/base/domain/base_usecase.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/repository/all_characters_repository.dart';

class SearchSingleCharacterUsecase
    extends BaseUsecase<AllCharactersEntity, SearchSingleCharacterParams> {
  final AllCharacterRepository _repository;

  SearchSingleCharacterUsecase({required AllCharacterRepository repository})
    : _repository = repository;
  @override
  Future<AllCharactersEntity> execute({
    required SearchSingleCharacterParams params,
  }) {
    return _repository.searchSingleCharacter(params: params);
  }
}

class SearchSingleCharacterParams extends BaseParams {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final int page;

  SearchSingleCharacterParams({
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.page,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
    };
  }
}
