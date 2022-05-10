import 'package:flutter/material.dart';
import '../const.dart';
import 'button_costum.dart';

class UserCard extends StatefulWidget {
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
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.height * 0.015),
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
            child: widget.img,
          ),
        ),
        SizedBox(width: widget.width * 0.05),
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
              widget.name,
              style: const TextStyle(
                color: kDark,
              ),
            ),
            SizedBox(height: widget.height * 0.03),
            const Text(
              'User ID',
              style: TextStyle(
                color: kDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.id,
              style: const TextStyle(
                color: kDark,
              ),
            ),
            SizedBox(height: widget.height * 0.02),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: widget.width * 0.025),
                margin: EdgeInsets.only(left: widget.width * 0.25),
                width: widget.width * 0.25,
                height: widget.height * 0.04,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: widget.width * 0.05,
                    ),
                    Expanded(
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            color: Colors.red, fontSize: widget.width * 0.045),
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
                    size: widget.height * 0.08,
                  ),
                  actions: <Widget>[
                    Buttoon(
                      texto: 'Delete',
                      color: Colors.red,
                      onClick: () => Navigator.pop(context),
                    ),
                    SizedBox(width: widget.height * 0.03),
                    Buttoon(
                      texto: 'Cancel',
                      color: kPurple,
                      onClick: () => Navigator.pop(context),
                    ),
                    SizedBox(width: widget.height * 0.04),
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
