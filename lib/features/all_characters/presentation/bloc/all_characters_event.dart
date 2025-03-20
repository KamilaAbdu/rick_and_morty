import 'package:rick_and_morty/base/presentation/base_event.dart';

class AllCharactersEvent extends BaseEvent {}

class FetchAllCharactersEvent extends AllCharactersEvent {
  final int page;

  FetchAllCharactersEvent({required this.page});
}

class SearchSingleCharacterEvent extends AllCharactersEvent {
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final int page;

  SearchSingleCharacterEvent({
    required this.page,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
  });
}
