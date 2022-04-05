import 'package:flutter/material.dart';
import '../components/textfield.dart';
import '../const.dart';

final emailcontroller = TextEditingController();
final passwordController = TextEditingController();

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignIn> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    final _formKey1 = GlobalKey<FormState>();
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
                  horizontal: _width * 0.03, vertical: _height * 0.15),
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 35,
                        color: kDark,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: _height * 0.05),
                  Form(
                    key: _formKey1,
                    child: Column(
                      children: [
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
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            RegExp regExp = RegExp(pattern);
                            if (val!.isEmpty) {
                              return 'Enter your password';
                            } else if (!regExp.hasMatch(val)) {
                              return 'Password must contain uppercase lowercase, digit, special caracter';
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
                      child: const Text('Login'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kPurple),
                      ),
                      onPressed: () {
                        if (_formKey1.currentState!.validate()) {
                          print("yessssssssssssss");
                          emailcontroller.clear();
                          passwordController.clear();
                        }
                      },
                    ),
                  ),
                  SizedBox(height: _height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: kGreyForText,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'New here?',
                            style: TextStyle(color: kGreyForText),
                          ),
                          TextButton(
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: kGreyForText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/signUp');
                            },
                          ),
                        ],
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
}