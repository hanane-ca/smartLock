import 'package:flutter/material.dart';
import 'package:smartlock/screens/first_screen.dart';
import 'package:smartlock/screens/home_screen.dart';
import 'package:smartlock/screens/settings_screen.dart';
import 'package:smartlock/screens/sign_in.dart';
import 'package:smartlock/screens/sign_up.dart';
import 'package:smartlock/screens/splash1.dart';
import 'package:smartlock/screens/splash2.dart';
import 'package:smartlock/screens/splash3.dart';
import 'package:provider/provider.dart';
import 'package:smartlock/screens/users_screen.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataCenter(),
      child: MaterialApp(
        title: 'Smart Lock',
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        routes: {
          '/': (context) => const FirstScreen(),
          '/splash1': (context) => const Splash1(),
          '/splash2': (context) => const Splash2(),
          '/splash3': (context) => const Splash3(),
          '/signIn': (context) => const SignIn(),
          '/signUp': (context) => const SignUp(),
          '/home': (context) => const HomeScreen(),
          '/users': (context) => const UsersScreen(),
          '/settings': (context) => const SettingsScreen()
        },
      ),
    );
  }
}
