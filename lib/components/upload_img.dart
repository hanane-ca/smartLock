import 'package:flutter/material.dart';

import '../const.dart';
import 'button_costum.dart';

class UploadImg extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final IconData icon;
  final String buttonText;
  final Function()? onclick;

  UploadImg({
    required this.height,
    required this.width,
    required this.text,
    required this.icon,
    required this.buttonText,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(height * 0.015),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(1, 5),
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: kGrey,
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.01),
          Text(
            text,
            style: const TextStyle(
              color: kDark,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: height * 0.02),
          Icon(
            icon,
            size: height * 0.05,
            color: kPurple,
          ),
          SizedBox(height: height * 0.02),
          Buttoon(texto: buttonText, color: kDark, onClick: onclick)
        ],
      ),
    );
  }
}
