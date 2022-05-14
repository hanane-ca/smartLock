import 'package:smartlock/main.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:smartlock/components/auth_credentials.dart';

class AuthService {
  late AuthCredentials _credentials;

  void loginWithCredentials(AuthCredentials credentials) async{
    try {
      final result = await Amplify.Auth.signIn(username: credentials.username, password: credentials.password);

      if (result.isSignedIn) {

      } else {
        print('User could not be Signed In');
      }
    } on AuthException catch(e) {
      print('Could not login - ${e}');
    }
  }

  void signUpWithCredentials(SignUpCredentials credentials) async{
    print('BBBBBBBB');
    try {
      final userAttributes = {CognitoUserAttributeKey.email: credentials.email};

      final result = await Amplify.Auth.signUp(
          username: credentials.username,
          password: credentials.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));

      if (result.isSignUpComplete) {
        this._credentials = credentials;
        loginWithCredentials(credentials);
      } else {
        this._credentials = credentials;
      }
    } on AuthException catch (e) {
      print('Failed to sign up - ${e}');
    }
  }

  void verifyCode(String verification) async{
    try {
      final result = await Amplify.Auth.confirmSignUp(username: _credentials.username, confirmationCode: verification);

      if (result.isSignUpComplete) {
        loginWithCredentials(_credentials);
      } else {
        //
      }
    } on AuthException catch(e) {
      print('Could not verify code - ${e}');
    }
  }

  void logOut() {
    print("DDDD");
  }


  void checkAuthStatus() {
    print("EEE");
}
}