import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartlock/components/auth_service.dart';
import 'package:smartlock/components/storage_service.dart';
import 'package:smartlock/screens/door_screen.dart';
import 'package:smartlock/screens/settings_screen.dart';
import 'package:smartlock/screens/users_screen.dart';

class DataCenter extends ChangeNotifier {
  //for bottom nav bar
  int selectedIndex = 0;
  final _storageService = StorageService();

  List<Widget> initialWidgets = <Widget>[
    const DoorScreen(),
    UsersScreen(/*imgUrlsController: () {
      final _storageService = StorageService();
      _storageService.getImages();
      return _storageService.imageUrlsController;
    }.call()*/),
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

  StreamController<List<List<String>>> _getUrl() {
    _storageService.getImages();
    return _storageService.imageUrlsController;
  }
}
