import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/locations/data/models/location_model.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/grid_view_location_card.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/location_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridListViewLocation extends StatelessWidget {
  final ValueNotifier<bool> isListView;
  final List<LocationModel> locationModelList;

  const GridListViewLocation({
    super.key,
    required this.isListView,
    required this.locationModelList,
  });

  @override
  Widget build(BuildContext context) {
    return isListView.value
        ? ListView.separated(
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) {
              return LocationCard(locationModel: locationModelList, );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 24.h);
            },
            itemCount: locationModelList.length,
          )
        : GridView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: locationModelList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 226,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) => GridViewLocationCard(
              locationModel: locationModelList,
            ),
          );
  }
}

