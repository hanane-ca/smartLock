import 'package:flutter/material.dart';

import '../const.dart';
import 'button_costum.dart';

class DeleteAlert extends StatelessWidget {
  double height = 0;
  double width = 0;
  String name = '';
  String id = '';
  Image img = Image.asset(
    'assets/images/boy.png',
  );

  DeleteAlert(
      {required this.height,
      required this.width,
      required this.name,
      required this.id,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(children: [
        const Text("Are you sure ?"),
        SizedBox(width: width * 0.05),
        const Icon(
          Icons.delete_forever,
          color: Colors.red,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Buttoon(
              texto: 'Delete',
              color: Colors.red,
              onClick: () {},
            ),
            SizedBox(height: height * 0.02),
            Buttoon(
              texto: 'Cancel',
              color: kPurple,
              onClick: () {},
            ),
          ],
        ),
      ]),
    );
  }
}
