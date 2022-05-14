import 'package:flutter/material.dart';
import 'package:smartlock/components/auth_credentials.dart';
import 'package:smartlock/screens/sign_in.dart';
import '../components/button_costum.dart';
import '../components/textfield.dart';
import '../const.dart';

final emailcontroller = TextEditingController();
final passwordController = TextEditingController();
final passwordConfirmController = TextEditingController();
final userNameController = TextEditingController();
final verifyCodeController = TextEditingController();

class SignUp extends StatefulWidget {
  final ValueChanged<SignUpCredentials> didProvideCredentials;
  final ValueChanged<String> didVerify;
  SignUp({Key? key, required this.didProvideCredentials, required this.didVerify}) : super(key: key);
  @override
  State<SignUp> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignUp> {
  String email = '';
  String password = '';
  String passwordConfirm = '';
  String username = '';
  final _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: _width * -0.38,
              left: _width * -0.6,
              child: Container(
                width: _width * 1.35,
                height: _width * 1.35,
                decoration: BoxDecoration(
                  color: kBigCircle,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: _width * 0.55,
              left: _width * 0.8,
              child: Container(
                width: _width * 0.6,
                height: _width * 0.6,
                decoration: BoxDecoration(
                  color: kLittleCircle,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _width * 0.03, vertical: _height * 0.1),
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 35,
                        color: kDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: _height * 0.05),
                  Form(
                    key: _formKey2,
                    child: Column(
                      children: [
                        Textfields(
                          hintText: 'Enter your camera code',
                          suffixe: const Icon(
                            Icons.lock,
                            color: kDark,
                            size: 25,
                          ),
                          height: _height,
                          width: _width,
                          controller: userNameController,
                          onChanged: (value) {
                            username = value;
                          },
                          validator: (String? val) {
                            if (val!.length < 7) {
                              return 'Entre a valid camera code';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Textfields(
                          hintText: 'Enter email address',
                          suffixe: const Icon(
                            Icons.email,
                            color: kDark,
                            size: 25,
                          ),
                          height: _height,
                          width: _width,
                          controller: emailcontroller,
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (String? val) {
                            const pattern =
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                            if (val != null && val.isEmpty) {
                              return 'Entrez une adresse mail valide';
                            } else if (!RegExp(pattern).hasMatch(val!) ||
                                val.toString().length < 10) {
                              return 'Entrez votre email';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Textfields(
                          hintText: 'Enter Password',
                          suffixe: const Icon(
                            Icons.key_rounded,
                            color: kDark,
                            size: 25,
                          ),
                          height: _height,
                          width: _width,
                          controller: passwordController,
                          password: true,
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (String? val) {
                            String pattern =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                            RegExp regExp = RegExp(pattern);
                            if (val!.isEmpty) {
                              return 'Enter your password';
                            } else if (!regExp.hasMatch(val)) {
                              return 'Password must contain uppercase lowercase & digit';
                            }
                            return null;
                          },
                        ),
                        Textfields(
                          hintText: 'Confirm Password',
                          suffixe: const Icon(
                            Icons.key_rounded,
                            color: kDark,
                            size: 25,
                          ),
                          height: _height,
                          width: _width,
                          controller: passwordConfirmController,
                          password: true,
                          onChanged: (value) {
                            passwordConfirm = value;
                          },
                          validator: (String? val) {
                            if (val != password) {
                              return 'Passwords does not match';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * 0.04),
                  Container(
                    height: 50,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 90, vertical: 0),
                    child: ElevatedButton(
                      child: const Text('Sign up'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPurple),
                      ),
                      onPressed: () {
                        if (_formKey2.currentState!.validate()) {
                          _signUp();
                          showDialog<String>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Center(
                                child: Text(
                                  "Verification code",
                                  style: TextStyle(
                                    color: kDark,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              content: Textfields(
                                controller: verifyCodeController,
                                height: _height,
                                width: _width,
                                hintText: "Enter code",
                                suffixe: const Icon(Icons.key),
                              ),
                              actions: <Widget>[
                                Buttoon(
                                  texto: 'Send',
                                  color: kPurple,
                                  onClick: () => _verify(),
                                ),
                                SizedBox(width: _width * 0.23),
                              ],
                            ),
                          );
                          emailcontroller.clear();
                          passwordController.clear();
                          passwordConfirmController.clear();
                          userNameController.clear();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: _height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: kGreyForText),
                      ),
                      TextButton(
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              color: kGreyForText,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signIn');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verify() {
    final verifyCode = verifyCodeController.text.trim();
    widget.didVerify(verifyCode);
  }

  void _signUp() {
    final username = userNameController.text.trim();
    final email = emailcontroller.text.trim();
    final password = passwordConfirmController.text.trim();

    final credentials = SignUpCredentials(username: username, password: password, email: email);
    widget.didProvideCredentials(credentials);
  }
}
