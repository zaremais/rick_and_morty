import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/character/data/models/character_model.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/screens/character_screen/character_info_screen.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/text_helper.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';
import '../../../../internal/helpers/utils.dart';

class CharacterCard extends StatelessWidget {
  final LocationModel characterModel;

  const CharacterCard({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterInfoScreen(
              characterModel: characterModel,
            ),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(37.r),
            child: CircleAvatar(
              radius: 37.r,
              child: Image.network(characterModel.image.toString()),
            ),
          ),
          SizedBox(width: 18.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                characterModel.status.toString(),
                style: TextHelper.w500s10.copyWith(
                  color: getStatusColor(characterModel.status ?? ''),
                ),
              ),
              Text(
                characterModel.name.toString(),
                style: TextHelper.w500s16
                    .copyWith(color: ColorHelper.cardNameColor),
              ),
              Text(
                characterModel.gender.toString(),
                style: TextHelper.w400s12
                    .copyWith(color: ColorHelper.cardGenderColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
