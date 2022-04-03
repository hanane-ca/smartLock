// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../const.dart';

class TextFieldDeco {
  InputDecoration textFieldDeco(String hintTexto, Widget suffixe, double height,
      double width, Color color) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      suffixIcon: suffixe,
      contentPadding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.1),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: kGrey)),
      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kGrey)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kGrey)),
      border: OutlineInputBorder(
          borderSide: BorderSide(
        color: kDark,
      )),
      hintText: hintTexto,
      hintStyle: TextStyle(
        color: color,
        height: height * 0.0018,
        fontSize: height * 0.02,
        fontFamily: 'MontMedium',
      ),
    );
  }
}
