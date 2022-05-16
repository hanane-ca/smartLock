import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartlock/components/storage_service.dart';
import 'package:smartlock/const.dart';

import '../components/button_costum.dart';
import '../components/userCard.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key, /*required this.imgUrlsController*/}) : super(key: key);
  //final StreamController<List<String>> imgUrlsController;
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
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final StorageService _storageService = StorageService();
    _storageService.getImages();
    StreamController<List<String>> _imgUrlsController = _storageService.imageUrlsController;
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
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          List<String> items = snapshot.data as List<String>;

                          String string = snapshot.data.toString();
                          print("has data ${snapshot.data.toString()}");
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return UserCard(
                                  height: _height,
                                  width: _width,
                                  name: items[index].substring(0,10),
                                  img: CachedNetworkImage(
                                    imageUrl: items[index],
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                        alignment: Alignment.center,
                                        child: CircularProgressIndicator()),
                                  )
                              );
                            },
                          );
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
                          SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                          // 7
                          return Placeholder();
                        }); }
                      } else {
                        print("no data");
                        return GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
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
