import 'package:dio/dio.dart';
import 'package:rick_and_morty/features/all_characters/data/model/all_character_model.dart';
import 'package:rick_and_morty/features/all_characters/data/source/all_characters_data_source.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';

class AllCharactersRemoteDataSource implements AllCharactersDataSource{
final Dio _dio;

  AllCharactersRemoteDataSource({required Dio dio}) : _dio = dio;


  @override
  Future<AllCharactersModel> fetchAllCharacters({required FetchAllCharactersParams params}) async {
    final response = await _dio.get('character', queryParameters: params.toJson());
    return AllCharactersModel.fromJson(response.data);
  }

}