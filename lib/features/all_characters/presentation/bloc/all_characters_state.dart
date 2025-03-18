import 'package:rick_and_morty/base/presentation/base_state.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';

class AllCharactersState extends BaseState<AllCharactersEntity>{
  AllCharactersState({required super.status, super.model});
}