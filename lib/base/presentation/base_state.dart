import 'package:rick_and_morty/core/enums/state_status.dart';

class BaseState<T> {
  final T model;
  final StateStatus status;

  BaseState({required this.model, required this.status});
}