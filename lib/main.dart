import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smartlock/amplifyconfiguration.dart';
import 'package:smartlock/components/auth_credentials.dart';
import 'package:smartlock/components/auth_service.dart';
import 'package:smartlock/screens/first_screen.dart';
import 'package:smartlock/screens/home_screen.dart';
import 'package:smartlock/screens/new_user_pic.dart';
import 'package:smartlock/screens/new_user_screen.dart';
import 'package:smartlock/screens/settings_screen.dart';
import 'package:smartlock/screens/sign_in.dart';
import 'package:smartlock/screens/sign_up.dart';
import 'package:smartlock/screens/splash1.dart';
import 'package:smartlock/screens/splash2.dart';
import 'package:smartlock/screens/splash3.dart';
import 'package:provider/provider.dart';
import 'package:smartlock/screens/users_screen.dart';
import 'data.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //MyApp({Key? key}) : super(key: key);
  final _authService = AuthService();
  void initState() {
    super.initState();
    _configureAmplify();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataCenter(),
      child: MaterialApp(
        title: 'Smart Lock',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const FirstScreen(),
          '/splash1': (context) => const Splash1(),
          '/splash2': (context) => const Splash2(),
          '/splash3': (context) => const Splash3(),
          '/signIn': (context) => SignIn(didProvideCredentials: _authService.loginWithCredentials),
          '/signUp': (context) => SignUp(didProvideCredentials: _authService.signUpWithCredentials, didVerify: _authService.verifyCode),
          '/home': (context) => const HomeScreen(),
          '/users': (context) => const UsersScreen(),
          '/settings': (context) => SettingsScreen(shoudLogOut: _authService.logOut),
          '/newUserPic': (context) => const NewUserPic(),
          '/newUserScreen': (context) => const NewUserScreen(),
        },
      ),
    );
  }
  void _configureAmplify() async {
    Amplify.addPlugin(AmplifyAuthCognito());
    try {
      await Amplify.configure(amplifyconfig);
      print("Amplify SUCCESS");
    } catch (e) {
      print("Amplify Failure : $e");
    }
  }
}
