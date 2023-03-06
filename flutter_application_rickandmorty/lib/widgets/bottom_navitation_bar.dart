import 'package:flutter/material.dart';
import 'package:flutter_application_rickandmorty/features/character/presentation/screens/character_screen/character_search_screen.dart';
import 'package:flutter_application_rickandmorty/features/locations/presentation/screens/location_screen/location_searth_screen.dart';
import 'package:flutter_application_rickandmorty/internal/helpers/color_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottomBarScreen extends StatefulWidget {
  const MyBottomBarScreen({super.key});

  @override
  State<MyBottomBarScreen> createState() => _MyBottomBarScreenState();
}

class _MyBottomBarScreenState extends State<MyBottomBarScreen> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> widgetOptions = [
    const CharacterSearchScreen(),
    const LocationSearchScreen(), // заменить
    const CharacterSearchScreen(),
    const CharacterSearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              "assets/icon/Subtract.png",
              width: 24.r,
              color: ColorHelper.blue22A2BD,
            ),
            label: "Персонажи",
            icon: Image.asset(
              "assets/icon/Subtract.png",
              width: 24.r,
              color: ColorHelper.bottomNavIconColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Локациии",
            activeIcon: Image.asset(
              "assets/icon/location_24px.png",
              width: 24.r,
              color: ColorHelper.blue22A2BD,
            ),
            icon: Image.asset(
              "assets/icon/location_24px.png",
              width: 24.r,
              color: ColorHelper.bottomNavIconColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Эпизоды",
            icon: Image.asset(
              "assets/icon/episode.png",
              width: 24.r,
              color: ColorHelper.bottomNavIconColor,
            ),
          ),
          BottomNavigationBarItem(
            label: "Настройки",
            icon: Image.asset(
              "assets/icon/setting.png",
              width: 24.r,
              color: ColorHelper.bottomNavIconColor,
            ),
          ),
        ],
      ),
    );
  }
}
