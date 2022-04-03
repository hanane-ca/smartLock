import '../components/Splash.dart';
import 'package:flutter/material.dart';

class Splash2 extends StatelessWidget {
  const Splash2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SplashScreen(
          height: _height,
          width: _width,
          splashImage: 'assets/images/splash2.jpg',
          splashText: 'Manage the access',
          nextFunction: () {
            //Navigator.pushNamed(context, '/splash3');
          },
          skipFunction: () {
            //Navigator.pushNamed(context, '/signIn');
          },
        ),
      ),
    );
  }
}
