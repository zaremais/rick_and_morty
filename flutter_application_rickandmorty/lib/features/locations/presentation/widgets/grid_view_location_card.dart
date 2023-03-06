import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/locations/data/models/location_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/location_screen/location_info_screen.dart';

class GridViewLocationCard extends StatelessWidget {
  final List<LocationModel> locationModel;

  const GridViewLocationCard({
    super.key,
    required this.locationModel,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Column(children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => LocationInfoScreen(
                                locationModel: locationModel,
                              ))));
                },
                child: Column(
                  children: [
                    Container(
                      width: 343.w,
                      height: 150.h,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        child: Image(
                          image: AssetImage('assets/images/earth.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      child: Container(
                        width: 343.w,
                        height: 68.h,
                        color: Colors.black,
                        child: const Padding(
                          padding:
                              EdgeInsets.only(left: 16, top: 12, right: 12),
                          child: Text(
                            'ЗЕМЛЯ С -137',
                            style: TextStyle(color: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]);
          }),
    );
  }
}
