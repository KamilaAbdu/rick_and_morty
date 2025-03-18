import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/all_characters/domain/entity/all_characters_entity.dart';

class AllCharactersList extends StatelessWidget {
  const AllCharactersList({super.key, required this.characters});

  final List<CharacterEntity> characters;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFixedExtentList(
          itemExtent: 150,
          delegate: SliverChildBuilderDelegate(childCount: characters.length, (
            BuildContext context,
            int index,
          ) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(characters[index].image ?? ''),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(characters[index].status ?? ''),
                    Text(characters[index].name ?? ''),
                    Text(characters[index].species?? ''),

                  ],
                )
              ],
            );
          }),
        ),
      ],
    );
  }
}
