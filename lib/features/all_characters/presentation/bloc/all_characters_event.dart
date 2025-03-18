import 'package:rick_and_morty/base/presentation/base_event.dart';

class AllCharactersEvent extends BaseEvent{}

class FetchAllCharactersEvent extends AllCharactersEvent{
  final int page;

  FetchAllCharactersEvent({required this.page});
}