import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/logic/bloc/location_bloc.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/grid_list_view_location.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/grid_view_location_card.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/grid_view_total_card.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/search_location_card.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/error_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationSearchScreen extends StatefulWidget {
  const LocationSearchScreen({super.key});

  @override
  State<LocationSearchScreen> createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  final LocationBloc locationBloc = LocationBloc();
  int widgetIndex = 0;
  List<Widget> listofPages = [];
  ValueNotifier<bool> isListView = ValueNotifier(true);

  void onItemSelected(int index) {
    widgetIndex = index;
  }

  @override
  void initState() {
    locationBloc.add(GetLocationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.backgroundColor,
      body: BlocConsumer<LocationBloc, LocationState>(
        bloc: locationBloc,
        listener: (context, state) {
          if (state is LocationErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(getErrors(state.error))));
          }
          if (state is LocationLoadingState) {
            const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            );
          }
        },
        builder: (context, state) {
          if (state is LocationFetchedState) {
            return ValueListenableBuilder(
                valueListenable: isListView,
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SearchLocationCardWidget(),
                        Padding(
                          padding: EdgeInsets.only(top: 24.h, bottom: 8.h),
                          child: Text(
                              'Всего локаций: ${state.locationModelList.length}'),
                        ),
                        Expanded(
                          child: GridViewLocationCard(locationModel: state.locationModelList,))
                      ],
                    ),
                  );
                });
          }

          if (state is LocationErrorState) {
            return Center(
              child: IconButton(
                onPressed: () {
                  locationBloc.add(GetLocationEvent());
                },
                icon: const Icon(Icons.refresh),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}



             
      
// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_rickandmorty/features/locations/presentation/logic/bloc/location_bloc.dart';
// // import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/grid_list_view_location.dart';
// // import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/grid_view_total_card.dart';
// // import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/search_location_card.dart';
// // import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import '../../../../../internal/helpers/error_helper.dart';

// // class LocationSearchScreen extends StatefulWidget {
// //   const LocationSearchScreen({super.key});

// //   @override
// //   State<LocationSearchScreen> createState() => _LocationSearchScreenState();
// // }

// // class _LocationSearchScreenState extends State<LocationSearchScreen> {
// //   // bool isActive = true;
// //   final LocationBloc locationBloc = LocationBloc();
// //   int widgetIndex = 1;
// //   List<Widget> listofPages = [];
// //   ValueNotifier<bool> isListView = ValueNotifier(true);

// //   void onItemSelected(int index) {
// //     widgetIndex = index;
// //   }

// //   @override
// //   void initState() {
// //     locationBloc.add(GetLocationEvent());
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: ColorHelper.backgroundColor,
// //       body: Padding(
// //         padding: EdgeInsets.symmetric(horizontal: 16.w),
// //         child: Column(
// //           children: [
// //             const SearchLocationCardWidget (),
// //             Expanded(
// //               child: BlocConsumer(
// //                 bloc: locationBloc,
// //                 listener: (context, state) {
// //                   if (state is LocationErrorState) {
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                         SnackBar(content: Text(getErrors(state.error))));
// //                   }
// //                 },
// //                 builder: (context, state) {
// //                   print('state  === $state');
// //                   if (state is LocationLoadingState) {
// //                     return const Center(
// //                       child: CircularProgressIndicator(color: Colors.blue),
// //                     );
// //                   }

// //                   if (state is LocationFetchedState) {
// //                     return ValueListenableBuilder(
// //                         valueListenable: isListView,
// //                         builder: (context, value, child) {
// //                           return Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Padding(
// //                                 padding:
// //                                     EdgeInsets.only(top: 24.h, bottom: 8.h),
// //                                 child: GridViewTotalCard(
// //                                   isListView: isListView,
// //                                   totalCount: state.locationModelList.length,
// //                                   // в идеале переделать на общий count
// //                                 ),
// //                               ),
// //                             ],
// //                           );
// //                         });
// //                   }

// //                   if (state is LocationErrorState) {
// //                     return Center(
// //                       child: IconButton(
// //                         onPressed: () {
// //                           locationBloc.add(GetLocationEvent());
// //                         },
// //                         icon: const Icon(Icons.refresh),
// //                       ),
// //                     );
// //                   }

// //                   return const SizedBox();
// //                 },
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }


// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/widgets/framework.dart';
// // import 'package:flutter/src/widgets/placeholder.dart';
// // import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/search_location_card.dart';
// // import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';

// // class LocationSearchScreen extends StatefulWidget {
// //   const LocationSearchScreen({super.key});

// //   @override
// //   State<LocationSearchScreen> createState() => _LocationSearchScreenState();
// // }

// // class _LocationSearchScreenState extends State<LocationSearchScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: ColorHelper.backgroundColor,
// //       body: Padding(
// //         padding: EdgeInsets.symmetric(horizontal: 16.w),
// //         child: Column(children:  [
// //           const SearchLocationCardWidget(),
         
// //           Column( children: [
// //             Image.asset('assets/images/earth.png'),
// //           ],
// //           )
// //         ],
        
// //         ),

        
        
// //       ),
      
      
// //     );
// //   }
// // }



// // import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_application_rickandmorty/features/locations/presentation/logic/bloc/location_bloc.dart';
// import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/search_location_card.dart';
// import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
// import 'package:flutter_application_rickandmorty/internal/helpers/error_helper.dart';
// import 'package:flutter_application_rickandmorty/internal/helpers/text_helper.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'location_info_screen.dart';

// class LocationSearchScreen extends StatefulWidget {

//   const LocationSearchScreen({
//     super.key,

//   });

//   @override
//   State<LocationSearchScreen> createState() => _LocationSearchScreenState();
// }

// class _LocationSearchScreenState extends State<LocationSearchScreen> {
//   // bool isActive = true;

//   final LocationBloc locationBloc = LocationBloc();
//   int widgetIndex = 1;
//   // final List<CharacterModel> characterModelList;
//   List<Widget> listOfPages = [];
//   void onItemSelected(int index) {
//     widgetIndex = index;
//   }

//   ValueNotifier<bool> isListView = ValueNotifier(true);
//   @override
//   void initState() {
//     locationBloc.add(GetLocationEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorHelper.backgroundColor,
//       body: Column(

//         children: [
//            const SearchLocationCardWidget(),
//           Expanded(
//             child: BlocConsumer<LocationBloc, LocationState>(
//               bloc: locationBloc,
//               listener: (context, state) {
//                 if (state is LocationErrorState) {
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text(getErrors(state.error))));
//                 }
//               },
//               builder: (context, state) {
//                 if (state is LocationFetchedState) {
//                   return SafeArea(
//                     child: ValueListenableBuilder(
//                       valueListenable: isListView,
//                       builder: ((context, value, child) {
//                         return Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16.w),
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   height: 54.h,
//                                 ),
//                                 // SearchLocationWidget(),
//                                 Padding(
//                                   padding: EdgeInsets.only(top: 24.h, bottom: 28.h),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationInfoScreen(locationmodelList: state.locationModelList, index:5 , )));

//           },
//                                   child: Container(
//                                     width: 343.w,
//                                     height: 218.h,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           width: 1.w, color: ColorHelper.cardNameColor),
//                                       borderRadius: BorderRadius.circular(20.r),
//                                     ),
//                                     child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           ClipRRect(
//                                               borderRadius: BorderRadius.only(
//                                                   topRight: Radius.circular(20.r),
//                                                   topLeft: Radius.circular(20.r)),
//                                               child: Image.asset(
//                                                 "assets/images/earth.png",
//                                                 fit: BoxFit.cover,
//                                               )),
//                                           Divider(
//                                             height: 12.h,
//                                           ),
//                                           Padding(
//                                             padding: EdgeInsets.only(left: 16.w),
//                                             child: Column(
//                                               children: [
//                                                 Text(
//                                                   "Земля C-137",
//                                                   style: TextHelper.w500s20.copyWith(
//                                                       color: ColorHelper.cardNameColor),
//                                                 ),
//                                                 Text(
//                                                   "Мир  Измерение С-137",
//                                                   style: TextHelper.w400s12.copyWith(
//                                                       color:
//                                                           ColorHelper.cardGenderColor),
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                         ]),
//                                   ),
//                                 ),
//                               ]),
//                         );
//                       }),
//                     ),
//                   );
//                 }
//                 return const SizedBox();
//               },
//             ),
//           ),
//         ],
//       ),

//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_application_rickandmorty/features/character/presentation/widgets/grid_list_view_icon.dart';
// import 'package:flutter_application_rickandmorty/features/locations/presentation/logic/bloc/location_bloc.dart';
// import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/grid_list_view_location.dart';
// import 'package:flutter_application_rickandmorty/features/locations/presentation/widgets/search_location_card.dart';
// import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
// import 'package:flutter_application_rickandmorty/internal/helpers/error_helper.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class LocationSearchScreen extends StatefulWidget {
//   const LocationSearchScreen({super.key});

//   @override
//   State<LocationSearchScreen> createState() => _LocationSearchScreen();
// }

// class _LocationSearchScreen extends State<LocationSearchScreen> {
//   final LocationBloc locationBloc = LocationBloc();
//   int widgetIndex = 0;
//   List<Widget> listOfPage = [];
//   ValueNotifier<bool> isListView = ValueNotifier(true);

//   void onTabSelected(int index) {
//     widgetIndex = index;
//   }

//   @override
//   void initState() {
//     locationBloc.add(GetLocationEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorHelper.backgroundColor,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: Column(
//           children: [
//             const SearchLocationCardWidget(),
//             Expanded(
//               child: BlocConsumer(
//                 bloc: locationBloc,
//                 listener: (context, state) {
//                   if (state is LocationErrorState) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text(getErrors(state.error))));
//                   }
//                 },
//                 builder: (context, state) {
//                   print('state  ====== $state');
//                   if (state is LocationLoadingState) {
//                     return const Center(
//                       child: CircularProgressIndicator(color: Colors.blue),
//                     );
//                   }

//                   if (state is LocationFetchedState) {
//                     return ValueListenableBuilder(
//                         valueListenable: isListView,
//                         builder: (context, value, child) {
//                           return Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding:
//                                     EdgeInsets.only(top: 24.h, bottom: 8.h),
//                                 child: GridViewListViewIconCard(
//                                   isListView: isListView,
//                                   totalCount: state.locationModelList.length,
//                                   // в идеале переделать на общий count
//                                 ),
//                               ),
//                               Expanded(
//                                 child: GridListViewLocation
//                                 (
//                                   isListView: isListView,
//                                   locationModelList: const [],
                                 
                                 
//                                 ),
//                               ),
//                             ],
//                           );
//                         });
//                   }

//                   if (state is LocationErrorState) {
//                     print('state  === $state');
//                     return Center(
//                       child: IconButton(
//                         onPressed: () {
//                           locationBloc.add(GetLocationEvent());
//                         },
//                         icon: const Icon(Icons.refresh),
//                       ),
//                     );
//                   }

//                   return const SizedBox();
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
