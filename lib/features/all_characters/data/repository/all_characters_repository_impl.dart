import 'package:rick_and_morty/features/all_characters/data/source/all_characters_data_source.dart';
import 'package:rick_and_morty/features/all_characters/data/source/remote/all_characters_remote_data_source.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';
import 'package:rick_and_morty/features/all_characters/domain/repository/all_characters_repository.dart';

class AllCharactersRepositoryImpl extends AllCharacterRepository {
  final AllCharactersDataSource _dataSource;

  AllCharactersRepositoryImpl({required AllCharactersDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<CharacterEntity> fetchAllCharacters() {
    return _dataSource.fetchAllCharacters();
  }
}
