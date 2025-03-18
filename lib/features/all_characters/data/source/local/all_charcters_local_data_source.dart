import 'package:rick_and_morty/features/all_characters/data/model/all_character_model.dart';
import 'package:rick_and_morty/features/all_characters/data/source/all_characters_data_source.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';

class AllCharactersLocalDataSource implements AllCharactersDataSource{
  @override
  Future<AllCharactersModel> fetchAllCharacters({required FetchAllCharactersParams params}) {
    // TODO: implement fetchAllCharacters
    throw UnimplementedError();
  }

}