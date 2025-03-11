import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class DioSettings {
  late final Dio dio;
  final Logger logger = Logger();

  DioSettings() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api/', 
        connectTimeout: const Duration(seconds: 100), 
        receiveTimeout: const Duration(seconds: 100), 
        responseType: ResponseType.json, 
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    dio.interceptors.addAll([
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          logger.i('REQUEST: ${options.method} ${options.uri}');
          logger.i('HEADERS: ${options.headers}');
          logger.i('BODY: ${options.data}');
          
          return handler.next(options);
        },
        onResponse: (response, handler) {
          logger.i('RESPONSE: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          logger.e('ERROR: ${e.response?.statusCode} ${e.message}');
          return handler.next(e);
        },
      ),
    ]);
  }

  Dio get instance => dio;
}
