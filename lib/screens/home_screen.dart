import 'dart:developer';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:weather_app/screens/info_page.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_page.dart';
import 'package:weather_app/widgets/animated_bottom_bar.dart';
import 'package:weather_app/widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String id = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final solidIcons = [
    SolarIconsBold.home,
    SolarIconsBold.infoCircle,
    //SolarIconsBold.user,
  ];
  final outlinedIcons = [
    SolarIconsOutline.home,
    SolarIconsOutline.infoCircle,
    // SolarIconsOutline.user,
  ];
  final labels = [
    'Home',
    'Info',
    // 'Personal',
  ];
  int activeIndex = 0;

  final List pages = const [WeatherPage(), InfoPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('weather'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.id);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: pages[activeIndex],
      extendBody: true,
      bottomNavigationBar:
          // CustomBottomNavigationBar(
          //   onTap: (index) {
          //     activeIndex = index;
          //     setState(() {});
          //   },
          //   selectedIndex: activeIndex,
          //   selectedItems: List.generate(solidIcons.length, (index) {
          //     return BottomNavItem(icon: solidIcons[index], label: labels[index]);
          //   }),
          //   items: List.generate(solidIcons.length, (index) {
          //     return BottomNavItem(
          //         icon: outlinedIcons[index], label: labels[index]);
          //   }),
          //   //
          // ),
          AnimatedBottomBar(
        icons: solidIcons
            .map((e) => IconModel(icon: e, id: solidIcons.indexOf(e)))
            .toList(),
        currentIcon: activeIndex,
        onTap: (index) {
          activeIndex = index;
          setState(() {});
        },
      ),
      //! this widget  cause the app to crash after searching again
      //! dont use packages as much as you can do the job your self
      //     AnimatedBottomNavigationBar.builder(
      //   itemCount: pages.length,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.softEdge,
      //   tabBuilder: (index, isActive) {
      //     return Icon(
      //       isActive ? solidIcons[index] : outlinedIcons[index],
      //       size: 28,
      //       color: Theme.of(context).primaryColor,
      //     );
      //   },
      //   activeIndex: activeIndex,
      //   onTap: (index) {
      //     activeIndex = index;
      //     setState(() {});
      //     log('toggeled $activeIndex');
      //   },
      //   // leftCornerRadius: 32,
      //   // rightCornerRadius: 32,
      //   height: 70,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   shape: const CircleBorder(),
      //   onPressed: () {},
      //   backgroundColor: Colors.white,
      //   child: Icon(
      //     Icons.manage_search_sharp,
      //     color: Theme.of(context).primaryColor,
      //     size: 30,
      //   ),
      // ),
    );
  }
}
