import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';

abstract class AllCharacterRepository {
  Future<AllCharactersEntity> fetchAllCharacters();
}