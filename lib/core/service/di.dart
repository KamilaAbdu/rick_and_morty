import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/service/dio_settings.dart';
import 'package:rick_and_morty/core/service/shared_prefs.dart';
import 'package:rick_and_morty/features/all_characters/data/repository/all_characters_repository_impl.dart';
import 'package:rick_and_morty/features/all_characters/data/source/remote/all_characters_remote_data_source.dart';
import 'package:rick_and_morty/features/all_characters/domain/usecase/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty/features/all_characters/presentation/bloc/all_characters_bloc.dart';

void setup({required GetIt di}) {
  di.registerSingleton(SharedPrefs());

  di.registerSingleton(Dio);
  // di.registerSingleton(AllCharactersDataSource);
  // di.registerSingleton(AllCharacterRepository);
  // di.registerSingleton(BaseUsecase);

  di.registerSingleton(
    AllCharactersBloc(
      fetchCharactersUsecase: FetchAllCharactersUsecase(
        repository: AllCharactersRepositoryImpl(
          dataSource: AllCharactersRemoteDataSource(dio: DioSettings().dio),
        ),
      ),
    ),
  );
}
