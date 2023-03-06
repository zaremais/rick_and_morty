import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/text_helper.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../internal/helpers/color_helper.dart';

class GridViewTotalCard extends StatelessWidget {
  const GridViewTotalCard({
    Key? key,
    required this.isListView,
    required this.totalCount,
  }) : super(key: key);

  final ValueNotifier<bool> isListView;
  final int totalCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "Всего локаций: $totalCount",
            // $totalCount
            style: TextHelper.w400s16
                .copyWith(color: ColorHelper.locationCountColor),
          ),
        ),
        IconButton(
          onPressed: (() {
            isListView.value = !isListView.value;
          }),
          icon: isListView.value
              ? Image.asset("assets/icon/menuIcon.png", width: 24.r)
              : Image.asset("assets/icon/rowMenuIcon.png", width: 24.r),
        )
      ],
    );
  }
}
