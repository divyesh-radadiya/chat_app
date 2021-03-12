import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_app/components/button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Widget _widget = LogIn();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final double smallLogo = 10;
    // final double bigLogo = 60;

    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(builder: (context, constraints) {
          final Size biggest = constraints.biggest;
          return Stack(children: [
            PositionedTransition(
                rect: RelativeRectTween(
                  begin: RelativeRect.fromSize(
                      Rect.fromLTWH(0, 0, 20, 20), biggest),
                  end: RelativeRect.fromSize(
                      Rect.fromLTWH(16, 242, 80, 80), biggest),
                ).animate(CurvedAnimation(
                  parent: controller,
                  curve: Curves.elasticInOut,
                )),
                child: Image.asset('images/logo.png')),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 60,
                      ),
                      TypewriterAnimatedTextKit(
                        isRepeatingAnimation: false,
                        speed: Duration(milliseconds: 800),
                        text: ['Flash Chat'],
                        textStyle: TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  AnimatedSwitcher(
                    duration: Duration(seconds: 2),
                    child: _widget,
                    transitionBuilder:
                        (Widget child, Animation<double> animation1) =>
                            SizeTransition(
                      sizeFactor: animation1,
                      child: child,
                    ),
                  ),
                  //Register(),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _widget = (_widget is LogIn) ? Register() : LogIn();
                        });
                      },
                      child: Center(
                          child: (_widget is LogIn)
                              ? Text('New User?')
                              : Text('Already User?'))),
                ],
              ),
            ),
          ]);
        }));
  }
}

class Register extends StatelessWidget {
  const Register({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Button(
        title: 'Register',
        function: () {
          Navigator.pushNamed(context, RegistrationScreen.id);
        },
        color: Colors.blueAccent,
      ),
    );
  }
}

class LogIn extends StatelessWidget {
  const LogIn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Button(
        function: () {
          Navigator.pushNamed(context, LoginScreen.id);
        },
        color: Colors.lightBlueAccent,
        title: 'Log In',
      ),
    );
  }
}
