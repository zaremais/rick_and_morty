import 'package:flutter/material.dart';
// import 'package:flutter_application_rickandmorty/features/character/presentation/screens/character_screen/character_search_screen.dart';
import 'package:flutter_application_rickandmorty/features/splash_screen/splash_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: ((context, child) {
        return const MaterialApp(
          title: 'Flutter Demo',
          home: SplashScreen(),
        );
      }),
    );
  }
}
