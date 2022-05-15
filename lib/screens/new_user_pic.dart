import 'package:flutter/material.dart';
import 'package:smartlock/components/upload_img.dart';
import 'package:smartlock/const.dart';
import 'package:image_picker/image_picker.dart';

class NewUserPic extends StatefulWidget {
  NewUserPic({Key? key, required this.didProvideImagePath}) : super(key: key);
  final ValueChanged<String>  didProvideImagePath;
  @override
  State<NewUserPic> createState() => _NewUserPicState();
}

class _NewUserPicState extends State<NewUserPic> {
  PickedFile? imageFile;

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
                onclick: () async {
                  final pickedFile = await ImagePicker().getImage(
                    source: ImageSource.gallery,
                  );
                  setState(() {
                    imageFile = pickedFile!;
                  });
                  print("GAlleryyyyyyyyyyy");
                  print(imageFile!.path);
                  _uploadPhoto(imageFile!.path);
                },
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
                onclick: () async {
                  final pickedFile = await ImagePicker().getImage(
                    source: ImageSource.camera,
                  );
                  setState(() {
                    imageFile = pickedFile!;
                  });
                  print("GAlleryyyyyyyyyyy");
                  print(imageFile!.path);
                  _uploadPhoto(imageFile!.path);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _uploadPhoto(String imagePath) {
    print('YYYYYYyyyYY');
    print(imagePath);
    widget.didProvideImagePath(imagePath);
  }
}
