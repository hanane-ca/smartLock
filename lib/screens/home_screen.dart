import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:smartlock/const.dart';
import '../data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    DataCenter data = Provider.of<DataCenter>(context);

    return SafeArea(
      child: Scaffold(
          body: data.initialWidgets[data.selectedIndex],
          bottomNavigationBar: FancyBottomNavigation(
            barBackgroundColor: kDark,
            circleColor: Colors.white,
            activeIconColor: kDark,
            inactiveIconColor: Colors.white,
            tabs: [
              TabData(iconData: Icons.home, title: ''),
              TabData(iconData: Icons.people, title: ''),
              TabData(iconData: Icons.settings, title: '')
            ],
            onTabChangedListener: (index) {
              data.onItemTapped(index);
            },
          )),
    );
  }
}
