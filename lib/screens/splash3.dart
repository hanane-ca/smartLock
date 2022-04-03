import '../components/Splash.dart';
import 'package:flutter/material.dart';

class Splash3 extends StatelessWidget {
  const Splash3({Key? key}) : super(key: key);
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
          splashImage: 'assets/images/splash3.webp',
          splashText: 'Easy to use',
          nextFunction: () {
            //Navigator.pushNamed(context, '/signIn');
          },
          skipFunction: () {},
          last: true,
        ),
      ),
    );
  }
}
