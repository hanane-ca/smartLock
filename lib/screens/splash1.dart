import '../components/Splash.dart';
import 'package:flutter/material.dart';

class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);

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
          splashImage: 'assets/images/splash1.jpg',
          splashText: 'Open door remotly',
          nextFunction: () {
            Navigator.pushNamed(context, '/splash2');
          },
          skipFunction: () {
            //Navigator.pushNamed(context, '/signIn');
          },
        ),
      ),
    );
  }
}
