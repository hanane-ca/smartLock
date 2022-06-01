import 'package:flutter/material.dart';
import 'package:smartlock/components/auth_service.dart';
import '../const.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<FirstScreen> {
  String nextPath = '';
  void initState() {
    super.initState();
    _configureAuth();
  }
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: _width * -0.38,
              left: _width * -0.6,
              child: Container(
                width: _width * 1.35,
                height: _width * 1.35,
                decoration: BoxDecoration(
                  color: kBigCircle,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: _width * 0.55,
              left: _width * 0.8,
              child: Container(
                width: _width * 0.6,
                height: _width * 0.6,
                decoration: BoxDecoration(
                  color: kLittleCircle,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  _width * 0.05, _height * 0.6, _width * 0.05, 0),
              child: ListView(
                children: <Widget>[
                  const Text(
                    'SMART LOCK',
                    style: TextStyle(
                      fontSize: 40,
                      color: kDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'The future is here...',
                    style: TextStyle(
                      fontSize: 15,
                      color: kDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: _height * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, nextPath);
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              color: kDark, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(width: _width * 0.05),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, nextPath);
                          },
                          child: const Icon(Icons.arrow_circle_right_sharp,
                              size: 45)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _configureAuth() async{
    AuthService _authService = AuthService();
    await Future.delayed(const Duration(seconds: 2), (){});
    bool isAuth = await _authService.checkAuthStatus();
    if (isAuth) {
      print("alreadyAuth");
      nextPath = '/home';
    } else {
      print("NEW");
      nextPath = '/splash1';
    }
  }
}
