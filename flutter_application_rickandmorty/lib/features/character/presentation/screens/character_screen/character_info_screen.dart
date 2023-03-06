import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/character/data/models/character_model.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/widgets/episodes_card.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/widgets/gender_species_card.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/widgets/profile_stack_card.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/text_helper.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CharacterInfoScreen extends StatelessWidget {
  final LocationModel characterModel;

  const CharacterInfoScreen({
    super.key,
    required this.characterModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileStackCard(image: characterModel.image ?? ''),
            Text(
              characterModel.name.toString(),
              style: TextHelper.w400s34,
            ),
            SizedBox(height: 24.h),
            Text(
              characterModel.status.toString(),
              style: TextHelper.w500s10
                  .copyWith(color: getStatusColor(characterModel.status ?? '')),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                16.w,
                36.h,
                16.w,
                24.h,
              ),
              child: Text(
                characterModel.origin?.name ?? '',
                // charactermodel.origin!.name.toString(),
                // "Главный протагонист мультсериала «Рик и Морти». Безумный ученый, чей алкоголизм, безрассудность и социопатия заставляют беспокоиться семью его дочери.",
                // style: TextHelper.w400s13,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: GenderSpaceiesCard(
                gender: characterModel.gender ?? '',
                species: characterModel.species ?? '',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Место рождения",
                        style: TextHelper.w400s12
                            .copyWith(color: ColorHelper.locationCountColor),
                      ),
                      Text(characterModel.origin?.name ?? '',
                          style: TextHelper.w400s14),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.r,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0.h, 16.w, 36.h),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Местоположение",
                        style: TextHelper.w400s12
                            .copyWith(color: ColorHelper.locationCountColor),
                      ),
                      Text(characterModel.location?.name ?? '',
                          style: TextHelper.w400s14),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 24.r,
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 2,
              color: ColorHelper.grey6,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                16.w,
                36.h,
                16.w,
                24.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Эпизоды",
                    style: TextHelper.w500s20,
                  ),
                  Text(
                    "Все эпизоды",
                    style: TextHelper.w400s12
                        .copyWith(color: ColorHelper.grey828282),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 375.w,
              child: const EdisodesCard(),
            )
          ],
        ),
      ),
    );
  }
}
