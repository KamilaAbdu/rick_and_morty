

abstract class BaseUsecase <T, E>{
  Future<T> execute({required E params});
}