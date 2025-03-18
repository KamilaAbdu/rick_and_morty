import 'package:rick_and_morty/features/all_characters/data/model/all_character_model.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';

abstract class AllCharactersDataSource {
  Future<AllCharactersModel> fetchAllCharacters({required FetchAllCharactersParams params});
}