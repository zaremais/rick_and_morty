import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/locations/data/models/location_model.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/text_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationInfoScreen extends StatelessWidget {
  final List<LocationModel> locationModel;

  const LocationInfoScreen({
    super.key,
    required this.locationModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                ),
                SizedBox(
                    width: 383.w,
                    height: 298.h,
                    child: Image.asset(
                      "assets/images/earth.png",
                      fit: BoxFit.cover,
                    )),
                Positioned(
                  left: 24.w,
                  top: 61.h,
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
                  top: 251.h,
                  child: Container(
                      width: 1.sw,
                      height: 1.sw,
                      decoration: BoxDecoration(
                          color: ColorHelper.bottomNavBarColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(26.r),
                              topRight: Radius.circular(26.r))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 34.h,
                            ),
                            Text(
                              "Земля C-137",
                              style: TextHelper.w400s14
                                  .copyWith(color: ColorHelper.cardNameColor),
                            ),
                            Divider(
                              height: 3.h,
                            ),
                            Text(
                              "Мир  Измерение С-137",
                              style: TextHelper.w400s12
                                  .copyWith(color: ColorHelper.cardGenderColor),
                            ),
                            Divider(
                              height: 32.h,
                            ),
                            Text(
                              "Это планета, на которой проживает человеческая раса, и главное место для персонажей Рика и Морти. Возраст этой Земли более 4,6 миллиардов лет, и она является четвертой планетой от своей звезды.",
                              style: TextHelper.w400s13
                                  .copyWith(color: ColorHelper.cardNameColor),
                            ),
                            Divider(
                              height: 36.h,
                            ),
                            Text(
                              "Персонажи",
                              style: TextHelper.w500s20
                                  .copyWith(color: ColorHelper.cardNameColor),
                            ),
                            Divider(
                              height: 24.h,
                            ),
                            Expanded(
                              child: ListView.separated(
                                  itemCount: locationModel.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 37.r,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(37.r),
                                            child: Image.asset(
                                                "assets/images/_image_.png"),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 18.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("alive"),
                                            Text("rick sanches"),
                                            Text("man")
                                          ],
                                        ),
                                        Spacer(),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 14.h,
                                            ))
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
