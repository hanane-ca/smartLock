import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smartlock/const.dart';

import '../components/button_costum.dart';
import '../components/userCard.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key, required this.imgUrlsController}) : super(key: key);
  final StreamController<List<String>> imgUrlsController;
  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  /*Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: _height * 0.5,
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
            Buttoon(
              texto: 'New user',
              color: kPurple,
              onClick: () {
                Navigator.pushNamed(context, '/newUserPic');
              },
            ),
            SizedBox(
              height: _height * 0.06,
            ),
          ],
        ),
      ),
    );
  }*/
  Widget build(BuildContext context) {
    StreamController<List<String>> _imgUrlsController = widget.imgUrlsController;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: _height * 0.5,
                padding: EdgeInsets.symmetric(
                    horizontal: _width * 0.05, vertical: _height * 0.03),
                child:
                  StreamBuilder(
                    stream: _imgUrlsController.stream,
                    builder: (context, snapshot) {

                      if (snapshot.hasData) {
                        List<String> data = snapshot.data;
                        print("has data ${snapshot.data.toString()}");
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return UserCard(
                              height: _height,
                              width: _width,
                              name: snapshot.data[index].toString(),
                              img: Image.asset('assets/images/girl.png')
                            );
                          },
                        );



                        return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              // 7
                              return Placeholder();
                            });
                        /*return ListView(children: [
                          UserCard(
                              height: _height,
                              width: _width,
                              name: 'aa',
                              img: CachedNetworkImage(
                                imageUrl: snapshot.data[index],
                                fit: BoxFit.cover,
                              ))
                        ],)*/
                      } else {
                        print("no data");
                        return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              // 7
                              return Placeholder();
                            });
                      }
                  }
                  )
                /*ListView(children: [
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
                ]),*/




              ),
            ),
            Buttoon(
              texto: 'New user',
              color: kPurple,
              onClick: () {
                Navigator.pushNamed(context, '/newUserPic');
              },
            ),
            SizedBox(
              height: _height * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}
