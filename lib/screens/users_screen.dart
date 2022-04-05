import 'package:flutter/material.dart';
import 'package:smartlock/const.dart';

import '../components/userCard.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _width * 0.05, vertical: _height * 0.03),
          child: ListView(children: [
            UserCard(
              height: _height,
              width: _width,
              name: 'Hanane CHRIF-EL-ASRI',
              id: 'U-4814',
              img: Image.asset(
                'assets/images/girl.png',
              ),
            ),
            SizedBox(height: _height * 0.03),
            UserCard(
              height: _height,
              width: _width,
              name: 'Nicolas lbogoss',
              id: 'U-4856',
              img: Image.asset(
                'assets/images/boy.png',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
