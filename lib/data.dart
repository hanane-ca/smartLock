import 'package:flutter/material.dart';
import 'package:smartlock/components/auth_service.dart';
import 'package:smartlock/screens/door_screen.dart';
import 'package:smartlock/screens/settings_screen.dart';
import 'package:smartlock/screens/users_screen.dart';

class DataCenter extends ChangeNotifier {
  //for bottom nav bar
  int selectedIndex = 0;

  List<Widget> initialWidgets = <Widget>[
    const DoorScreen(),
    const UsersScreen(),
    SettingsScreen(shoudLogOut: () { final _authService = AuthService();
      _authService.logOut();},),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  // for door screen
  bool doorIsOpen = false;

  void toggleDoor() {
    doorIsOpen = !doorIsOpen;
    notifyListeners();
  }
}
