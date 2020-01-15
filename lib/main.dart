import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'register.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
          builder: (context) => Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF915FB5), Color(0xFFCA436B)],
                        begin: FractionalOffset.bottomRight,
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Hero(
                            tag: 'logo',
                            child: Container(
                              child: Image.asset('images/herologo.png'),
                              height: 100,
                            ),
                          ),
                          TypewriterAnimatedTextKit(
                            speed: Duration(milliseconds: 300),
                            totalRepeatCount: 10,
                            text: ['Hero Wiki'],
                            textStyle: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          elevation: 5.0,
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(30.0),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistrationScreen()),
                              );
                            },
                            minWidth: 200.0,
                            height: 42.0,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
