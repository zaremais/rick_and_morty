import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/locations/data/models/location_model.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/screens/location_screen/location_info_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationCard extends StatelessWidget {
  final List<LocationModel> locationModel;

  const LocationCard({super.key, required this.locationModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationInfoScreen(
              locationModel: locationModel,
      
            ),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 37.r,
            child: Image.asset('assets/images/earth.png'),
          ),
          SizedBox(width: 18.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              // Text(
              //   locationModel.name.toString(),
              //   style: TextHelper.w500s10.copyWith(
              //     color: getStatusColor(locationModel.status ?? ''),
              //   ),
              // ),
              // Text(
              //   locationModel.url.toString(),
              //   style: TextHelper.w500s16
              //       .copyWith(color: ColorHelper.cardNameColor),
              // ),
              // Text(
              //   locationModel.gender.toString(),
              //   style: TextHelper.w400s12
              //       .copyWith(color: ColorHelper.cardGenderColor),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
