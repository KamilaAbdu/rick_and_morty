import 'package:rick_and_morty/features/all_characters/data/model/all_character_model.dart';

abstract class AllCharactersDataSource {
  Future<AllCharactersModel> fetchAllCharacters();
}