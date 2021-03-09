import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/components/button.dart';
import 'package:flash_chat_app/constants.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id = 'forgot_password_screen';
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _auth = FirebaseAuth.instance;
  String email;

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 24.0,
              ),
              Button(
                function: () async {
                  try {
                    setState(() {
                      showSpinner = true;
                    });
                    await _auth.sendPasswordResetEmail(email: email);

                    Navigator.pushNamed(context, LoginScreen.id);
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e.code);
                    List<String> k = getMessageFromErrorCode(
                        e.code, ForgotPasswordScreen.id);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text(k[0]),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.pushNamed(context, k[1]);
                                  },
                                ),
                              ],
                            ));
                  }
                },
                color: Colors.lightBlueAccent,
                title: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
