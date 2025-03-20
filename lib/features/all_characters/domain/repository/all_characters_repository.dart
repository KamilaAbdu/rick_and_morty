import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/search_single_character_usecase.dart';

abstract class AllCharacterRepository {
  Future<AllCharactersEntity> fetchAllCharacters({required FetchAllCharactersParams params});
  Future<AllCharactersEntity> searchSingleCharacter({required SearchSingleCharacterParams params});

}