import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/widgets/bottom_navitation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_images_2.png',
        width: 375.w,
        fit: BoxFit.fill,
      ),
    );
  }

  Future<void> navigate() async {
    await Future.delayed((const Duration(seconds: 3)))
        .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MyBottomBarScreen(),
              ),
            ));
  }
}
