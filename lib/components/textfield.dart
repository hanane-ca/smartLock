import 'dart:ffi';

import 'package:flutter/material.dart';
import 'textField_deco.dart';
import '../const.dart';

class Textfields extends StatefulWidget {
  late final String hintText;
  final TextInputType inputType;
  final void Function(String)? onChanged;
  final bool enabled;
  final TextEditingController? controller;
  final double height;
  final double width;
  final String? Function(String?)? validator;
  final void Function()? ontap;
  late final Icon suffixe;
  final bool password;

  Textfields({
    required this.hintText,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.enabled = true,
    this.controller,
    this.height = 0,
    this.validator,
    this.width = 0,
    this.ontap,
    required this.suffixe,
    this.password = false,
  });

  @override
  _TextfieldsState createState() => _TextfieldsState();
}

class _TextfieldsState extends State<Textfields> {
  TextFieldDeco deco = TextFieldDeco();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: widget.height * 0.01,
        horizontal: widget.width * 0.025,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(3, 5),
            ),
          ],
        ),
        child: TextFormField(
            onTap: () {
              widget.ontap;
            },
            validator: widget.validator,
            controller: widget.controller,
            style: textFildStyleText(),
            onChanged: widget.onChanged,
            obscureText: widget.password,
            decoration: deco.textFieldDeco(widget.hintText, widget.suffixe,
                widget.height, widget.width, kGreyForText)),
      ),
    );
  }

  TextStyle textFildStyleText() {
    return TextStyle(
      height: widget.height * 0.0018,
      color: kDark,
      fontSize: widget.height * 0.02,
      fontFamily: 'MontMedium',
    );
  }
}
