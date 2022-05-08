import 'package:flutter/material.dart';

class Buttoon extends StatelessWidget {
  final String texto;
  final Color color;
  final Function()? onClick;

  const Buttoon(
      {required this.texto, required this.color, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          texto,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
      ),
    );
  }
}
