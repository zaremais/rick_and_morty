import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/text_helper.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';

class EdisodesCard extends StatelessWidget {
  const EdisodesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        // physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
               
                Image.asset(
                  "assets/images/pilot.png",
                  width: 74.r,
                ),
                SizedBox(width: 16.w),
                Column(
                  children: [
                    Text(
                      "Серия 1",
                      style: TextHelper.w500s10
                          .copyWith(color: ColorHelper.blue22A2BD),
                    ),
                    Text(
                      "Пилот",
                      style: TextHelper.w500s16
                          .copyWith(color: ColorHelper.cardNameColor),
                    ),
                    Text(
                      "created",
                      style: TextHelper.w400s14
                          .copyWith(color: ColorHelper.grey6E798C),
                    ),
                  ],
                ),

                const SizedBox(width: 200,),
              
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 24.r,
                  ),
                ),
              ],
            ),
          );
        }),
        separatorBuilder: ((context, index) => SizedBox(
              height: 24.h,
            )),
        itemCount: 10);
  }
}