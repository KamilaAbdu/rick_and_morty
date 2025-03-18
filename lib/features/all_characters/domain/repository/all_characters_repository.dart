import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';

abstract class AllCharacterRepository {
  Future<AllCharactersEntity> fetchAllCharacters({required FetchAllCharactersParams params});
}