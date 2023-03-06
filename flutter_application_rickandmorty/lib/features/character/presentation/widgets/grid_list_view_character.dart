import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/character/data/models/character_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'character_card.dart';
import 'gridview_character_card.dart';

class GridListViewCharacter extends StatelessWidget {
  final ValueNotifier<bool> isListView;
  final List<LocationModel> chatacterModelList;

  const GridListViewCharacter({
    super.key,
    required this.isListView,
    required this.chatacterModelList,
  });

  @override
  Widget build(BuildContext context) {
    return isListView.value
        ? ListView.separated(
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return CharacterCard(characterModel: chatacterModelList[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 24.h);
            },
            itemCount: chatacterModelList.length,
          )
        : GridView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: chatacterModelList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 226,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) => GridViewCharacterCard(
              characterModel: chatacterModelList[index],
            ),
          );
  }
}
