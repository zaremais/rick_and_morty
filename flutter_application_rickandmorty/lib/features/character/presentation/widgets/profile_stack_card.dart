import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';

class ProfileStackCard extends StatelessWidget {
  const ProfileStackCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Stack(
        children: [
          SizedBox(
            width: 375.w,
            height: 218.h,
            child: Image.network(
              image,
              // width: 375.w,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 0.w,
            top: 21.h,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 24.r,
              ),
            ),
          ),
          Positioned(
            top: 145.h,
            left: 114.w,
            child: Container(
              width: 146.r,
              height: 146.r,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(width: 10, color: ColorHelper.pictureBorderColor),
                ),
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
