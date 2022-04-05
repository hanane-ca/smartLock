import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:smartlock/const.dart';
import 'package:smartlock/data.dart';
import 'package:provider/provider.dart';

class DoorScreen extends StatefulWidget {
  const DoorScreen({Key? key}) : super(key: key);

  @override
  State<DoorScreen> createState() => _DoorScreenState();
}

class _DoorScreenState extends State<DoorScreen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    DataCenter data = Provider.of<DataCenter>(context);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: _width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: _height * 0.1),
              Image.asset(data.doorIsOpen
                  ? 'assets/images/lock_open.png'
                  : 'assets/images/lock_closed.png'),
              SizedBox(height: _height * 0.05),
              Text(
                "locked",
                style: TextStyle(
                    fontSize: 25,
                    color: data.doorIsOpen
                        ? const Color(0xff068D0B)
                        : const Color(0xff751313),
                    fontWeight: FontWeight.bold),
              ),
              Visibility(
                visible: !data.doorIsOpen,
                child: Padding(
                  padding: EdgeInsets.all(_width * 0.1),
                  child: SlideAction(
                    onSubmit: () {
                      data.toggleDoor();
                    },
                    innerColor: kPurple,
                    outerColor: Colors.white,
                    sliderButtonIconSize: 30,
                    sliderButtonIconPadding: 3,
                    sliderButtonYOffset: 15,
                    textStyle: const TextStyle(fontSize: 20, color: kDark),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
