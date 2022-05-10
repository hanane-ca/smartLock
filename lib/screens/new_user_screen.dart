import 'package:flutter/material.dart';
import 'package:smartlock/components/button_costum.dart';
import 'package:smartlock/components/textfield.dart';
import 'package:smartlock/const.dart';

class NewUserScreen extends StatefulWidget {
  const NewUserScreen({Key? key}) : super(key: key);

  @override
  State<NewUserScreen> createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
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
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: _height * 0.07, horizontal: _width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "User image",
                style: TextStyle(
                  color: kDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                'assets/images/cam_girl.png',
              ),
              const Text(
                "Full name",
                style: TextStyle(
                  color: kDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Textfields(
                height: _height,
                width: _width,
                hintText: "Enter user's full name",
                suffixe: const Icon(
                  Icons.person,
                  size: 0,
                ),
              ),
              Buttoon(
                texto: "Save",
                color: kPurple,
                onClick: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Center(
                      child: Text(
                        "Enter password",
                        style: TextStyle(
                          color: kDark,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    content: Textfields(
                      height: _height,
                      width: _width,
                      hintText: "Enter password",
                      suffixe: const Icon(Icons.key),
                      password: true,
                    ),
                    actions: <Widget>[
                      Buttoon(
                        texto: 'OK',
                        color: kPurple,
                        onClick: () => Navigator.pop(context),
                      ),
                      SizedBox(width: _width * 0.23),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _height * 0.06,
              )
            ],
          ),
        ),
      ),
    );
  }
}
