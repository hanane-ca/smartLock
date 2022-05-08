import 'package:flutter/material.dart';

import '../const.dart';
import 'button_costum.dart';

class UserCard extends StatelessWidget {
  double height = 0;
  double width = 0;
  String name = '';
  String id = '';
  Image img = Image.asset(
    'assets/images/boy.png',
  );

  UserCard(
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
      child: Row(children: [
        Flexible(
          child: ClipRRect(
            child: img,
          ),
        ),
        SizedBox(width: width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Full Name',
              style: TextStyle(
                color: kDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                color: kDark,
              ),
            ),
            SizedBox(height: height * 0.03),
            const Text(
              'User ID',
              style: TextStyle(
                color: kDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              id,
              style: const TextStyle(
                color: kDark,
              ),
            ),
            SizedBox(height: height * 0.02),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                margin: EdgeInsets.only(left: width * 0.25),
                width: width * 0.25,
                height: height * 0.04,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: width * 0.05,
                    ),
                    Expanded(
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            color: Colors.red, fontSize: width * 0.045),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text("Are you sure ?"),
                  content: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: height * 0.08,
                  ),
                  actions: <Widget>[
                    Buttoon(
                      texto: 'Delete',
                      color: Colors.red,
                      onClick: () => Navigator.pop(context),
                    ),
                    SizedBox(width: height * 0.03),
                    Buttoon(
                      texto: 'Cancel',
                      color: kPurple,
                      onClick: () => Navigator.pop(context),
                    ),
                    SizedBox(width: height * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
