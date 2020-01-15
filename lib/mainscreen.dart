import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:super_hero_wikia/login_screen.dart';
import 'chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'search_hero.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

//leftDiceNumber = Random().nextInt(6) + 1;

Future<Post> fetchPost(int heroId) async {
  final response =
      await http.get('https://superheroapi.com/api/2659712750918182/$heroId');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final String intelligence;
  final String image;
  final String name;

  Post({this.intelligence, this.image, this.name});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        intelligence: json['powerstats']['intelligence'].toString(),
        image: json['image']['url'].toString(),
        name: json['name'].toString());
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      post = fetchPost(Random().nextInt(731) + 1);
    });
  }

  final _auth = FirebaseAuth.instance;

  Future<Post> post;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.yellow.shade700),
                accountName: Text('Sharan Babu'),
                accountEmail: Text('sharan.goku@yahoo.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Text('S'),
                ),
              ),
              ListTile(
                title: Text(
                  'Search Hero',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchHero();
                  }));
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.yellow.shade900,
              ),
              ListTile(
                title: Text('Global Chat'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChatScreen();
                  }));
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.yellow.shade900,
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                  _auth.signOut();
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
              ),
              Divider(
                thickness: 1,
                color: Colors.yellow.shade900,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text('Hero Database')),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChatScreen();
                  }));
                })
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  'Random Pick',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: 300,
                child: Divider(
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                      snapshot.data.image,
                      height: 300,
                    );
                  } else if (snapshot.hasError) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 40,
                        width: 400,
                        color: Colors.orange.shade300,
                        child: ListView(
                          children: <Widget>[
                            Center(
                                child: Text(
                              'ERROR! Check Spelling',
                              style: TextStyle(
                                  color: Colors.red.shade900, fontSize: 30),
                            ))
                          ],
                        ),
                      ),
                    );
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      'Name : ${snapshot.data.name}',
                      style: TextStyle(fontSize: 30),
                    );
                  } else if (snapshot.hasError) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 40,
                        width: 400,
                        color: Colors.orange.shade300,
                        child: ListView(
                          children: <Widget>[
                            Center(
                                child: Text(
                              'ERROR! Check Spelling',
                              style: TextStyle(
                                  color: Colors.red.shade900, fontSize: 30),
                            ))
                          ],
                        ),
                      ),
                    );
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(
                height: 15,
              ),
              FutureBuilder<Post>(
                future: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      'Intelligence : ${snapshot.data.intelligence}',
                      style: TextStyle(fontSize: 30),
                    );
                  } else if (snapshot.hasError) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 40,
                        width: 400,
                        color: Colors.orange.shade300,
                        child: ListView(
                          children: <Widget>[
                            Center(
                                child: Text(
                              'ERROR! Check Spelling',
                              style: TextStyle(
                                  color: Colors.red.shade900, fontSize: 30),
                            ))
                          ],
                        ),
                      ),
                    );
                  }

                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ),
      ),
    );
  }
}
