import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';

class AllCharactersModel extends AllCharactersEntity {
  AllCharactersModel.fromJson(Map<String, dynamic> json) {
    info =
        json['info'] != null ? AllCharactersInfo.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = <CharacterModel>[];
      json['results'].forEach((v) {
        results!.add(CharacterModel.fromJson(v));
      });
    }
  }
}

class AllCharactersInfo extends AllCharactersInfoEntity {
  AllCharactersInfo.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }
}

class CharacterModel extends CharacterEntity {
  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin =
        json['origin'] != null
            ? CharacterOrigin.fromJson(json['origin'])
            : null;
    location =
        json['location'] != null
            ? CharacterOrigin.fromJson(json['location'])
            : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }
}

class CharacterOrigin extends CharacterOriginEntity {
  CharacterOrigin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}
