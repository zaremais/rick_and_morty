import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/text_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';

class SearchCharacterCardWidget extends StatelessWidget {
  const SearchCharacterCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: 343.w,
      height: 49.h,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Найти персонажа",
          hintStyle: TextHelper.w400s16.copyWith(
            color: const Color(0xffBDBDBD),
          ),
          filled: true,
          fillColor: ColorHelper.textFieldColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: ColorHelper.textFieldIconColor,
              size: 24.r,
            ),
          ),
          suffixIcon: SizedBox(
            width: 65,
            height: 49.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 14.w),
                  height: 24.h,
                  width: 1,
                  color: const Color(0xffBDBDBD),
                ),
                Image.asset(
                  "assets/icon/suffixIcon.png",
                  width: 24.r,
                ),
                SizedBox(
                  width: 19.w,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
