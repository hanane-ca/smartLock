import 'package:flutter/material.dart';
import 'package:smartlock/components/upload_img.dart';
import 'package:smartlock/const.dart';

class NewUserPic extends StatefulWidget {
  const NewUserPic({Key? key}) : super(key: key);

  @override
  State<NewUserPic> createState() => _NewUserPicState();
}

class _NewUserPicState extends State<NewUserPic> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: kGrey,
          elevation: 0,
          leading: Container(
            child: const BackButton(color: Colors.white),
            decoration:
                const BoxDecoration(color: kDark, shape: BoxShape.circle),
            margin: EdgeInsets.all(_width * 0.015),
          ),
          title: const Text(
            "Add new User",
            style: TextStyle(color: kDark),
          ),
        ),
        body: Container(
          width: _width,
          padding: EdgeInsets.symmetric(
              horizontal: _width * 0.1, vertical: _height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              UploadImg(
                height: _height,
                width: _width,
                text: "Upload file",
                icon: Icons.upload_file_rounded,
                buttonText: "Upload",
                onclick: () {},
              ),
              const Text(
                "------------------ OR ------------------",
                style: TextStyle(fontSize: 18),
              ),
              UploadImg(
                height: _height,
                width: _width,
                text: "Open camera",
                icon: Icons.camera_alt,
                buttonText: "Camera",
                onclick: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
