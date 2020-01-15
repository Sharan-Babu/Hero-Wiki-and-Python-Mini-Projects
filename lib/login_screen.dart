import 'package:flutter/material.dart';
import 'package:super_hero_wikia/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'mainscreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'main.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.title, this.colour, @required this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyApp();
              }));
            }),
        backgroundColor: Colors.redAccent,
        title: Text('LOGIN'),
      ),
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 140,
                        child: Image.asset(
                          'images/sketch-3064404_1280.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 140,
                        child: Image.asset('images/sketch-3064403_1280.png',
                            fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email'),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  colour: Colors.lightBlueAccent,
                  onPressed: () async {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MainScreen();
                        }));
                      }

                      setState(() {
                        showSpinner = false;
                      });
                    } catch (e) {
                      setState(() {
                        showSpinner = false;
                      });
                      Alert(
                              context: context,
                              title: "ERROR",
                              desc: "Please enter valid credentials.")
                          .show();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
