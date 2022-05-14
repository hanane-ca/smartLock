import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:smartlock/const.dart';
import '../components/setting.dart';
import '../data.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback shoudLogOut;
  SettingsScreen({Key? key, required this.shoudLogOut}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    DataCenter data = Provider.of<DataCenter>(context);
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: _width * 0.05),
            child: Column(
              children: [
                SizedBox(height: _height * 0.08),
                const Setting(
                  icon: Icons.description,
                  title: 'Terms and conditions',
                ),
                const Setting(
                  icon: Icons.error,
                  title: 'About Us',
                ),
                const Setting(
                  icon: Icons.headset_mic,
                  title: 'Get support',
                ),
                GestureDetector(
                  onTap: () {
                    _logOut();
                    Navigator.pushNamed(context, '/signIn');
                  },
                  child: const Setting(
                    icon: Icons.power_settings_new,
                    title: 'Log out',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logOut() {
    widget.shoudLogOut();
  }
}
