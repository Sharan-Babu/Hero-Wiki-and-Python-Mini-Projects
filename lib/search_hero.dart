import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Post> fetchPost(String heroName) async {
  final response = await http
      .get('https://superheroapi.com/api/2659712750918182/search/$heroName');

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
  final String strength;
  final String speed;
  final String power;
  final String race;
  final String height;
  final String occupation;
  final String base;
  final String connections;
  final String affiliation;
  final String image;

  Post(
      {this.intelligence,
      this.strength,
      this.speed,
      this.power,
      this.race,
      this.height,
      this.occupation,
      this.base,
      this.connections,
      this.affiliation,
      this.image});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        intelligence:
            json['results'][0]['powerstats']['intelligence'].toString(),
        strength: json['results'][0]['powerstats']['strength'].toString(),
        speed: json['results'][0]['powerstats']['speed'].toString(),
        power: json['results'][0]['powerstats']['power'].toString(),
        race: json['results'][0]['appearance']['race'].toString(),
        height: json['results'][0]['appearance']['height'].toString(),
        occupation: json['results'][0]['work']['occupation'].toString(),
        base: json['results'][0]['work']['base'].toString(),
        connections:
            json['results'][0]['connections']['group-affiliation'].toString(),
        affiliation: json['results'][0]['connections']['relatives'].toString(),
        image: json['results'][0]['image']['url'].toString());
  }
}

class SearchHero extends StatefulWidget {
  SearchHero({Key key}) : super(key: key);
  @override
  _SearchHeroState createState() => _SearchHeroState();
}

class _SearchHeroState extends State<SearchHero> {
  String heroName = "";
  Future<Post> post;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Hero Search'),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      heroName = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Hero Name'),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      post = fetchPost(heroName);
                    });
                  },
                  child: Text('Search'),
                  color: Colors.green.shade700,
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
                    child: FutureBuilder<Post>(
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
                                        color: Colors.red.shade900,
                                        fontSize: 30),
                                  ))
                                ],
                              ),
                            ),
                          );
                        }

                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    )),
                FutureBuilder<Post>(
                  future: post,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          'Intelligence : ${snapshot.data.intelligence}');
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
                FutureBuilder<Post>(
                  future: post,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('Strength : ${snapshot.data.strength}');
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
                FutureBuilder<Post>(
                  future: post,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('Speed : ${snapshot.data.speed}');
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
                FutureBuilder<Post>(
                  future: post,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('Race : ${snapshot.data.race}');
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
                FutureBuilder<Post>(
                  future: post,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text('Base : ${snapshot.data.base}');
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//                Center(
//                  child: FutureBuilder<Post>(
//                    future: post,
//                    builder: (context, snapshot) {
//                      if (snapshot.hasData) {
//                        return Text(snapshot.data.intelligence);
//                      } else if (snapshot.hasError) {
//                        return Text("${snapshot.error}");
//                      }
//
//                      // By default, show a loading spinner.
//                      return CircularProgressIndicator();
//                    },
//                  ),
//                )
