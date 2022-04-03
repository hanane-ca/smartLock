import 'package:flutter/material.dart';
import '../const.dart';

class SplashScreen extends StatelessWidget {
  final double width;
  final double height;
  final String splashImage;
  final String splashText;
  final Function nextFunction;
  final Function skipFunction;
  final bool last;

  SplashScreen({
    required this.width,
    required this.height,
    required this.splashImage,
    required this.splashText,
    required this.nextFunction,
    required this.skipFunction,
    this.last = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: width * 1.65,
          left: width * 0.15,
          child: Container(
            width: width * 0.7,
            height: width * 0.7,
            decoration: BoxDecoration(
              color: kLittleCircle,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.fromLTRB(width * 0.05, height * 0.15, width * 0.05, 0),
          child: ListView(
            children: <Widget>[
              Container(
                width: width * 0.35,
                height: height * 0.35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(splashImage),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              Text(
                splashText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  color: kDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.1),
              Column(
                children: <Widget>[
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_circle_right_sharp,
                      size: 55,
                      color: kPurple,
                    ),
                    onTap: nextFunction(),
                  ),
                  Visibility(
                    visible: !last,
                    child: GestureDetector(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                            color: kLittleCircle, fontWeight: FontWeight.bold),
                      ),
                      onTap: skipFunction(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
