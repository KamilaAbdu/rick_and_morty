import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/all_characters/data/model/all_character_model.dart';
import 'package:rick_and_morty/features/all_characters/data/source/all_characters_data_source.dart';

class AllCharactersRemoteDataSource implements AllCharactersDataSource{
final Dio _dio;

  AllCharactersRemoteDataSource({required Dio dio}) : _dio = dio;


  @override
  Future<AllCharactersModel> fetchAllCharacters() async {
    final response = await _dio.get('character');
    return AllCharactersModel.fromJson(response.data);
  }

}