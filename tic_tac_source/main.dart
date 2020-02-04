import 'package:flutter/material.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<String> gameChecker = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  int w = 0;
  String victoryMessage = "";
  String currentPlayer = "Player1";
  static String q = "";
  String p1 = "X";
  String p2 = "O";
  String imgpath0 = "";
  String imgpath1 = "";
  String imgpath2 = "";
  String imgpath3 = "";
  String imgpath4 = "";
  String imgpath5 = "";
  String imgpath6 = "";
  String imgpath7 = "";
  String imgpath8 = "";
  Color initialAColor = Colors.blue;
  Color initialBcolor = Colors.grey;
  bool visibilitystate = false;
  bool ab0 = false;
  bool ab1 = false;
  bool ab2 = false;
  bool ab3 = false;
  bool ab4 = false;
  bool ab5 = false;
  bool ab6 = false;
  bool ab7 = false;
  bool ab8 = false;

  void reset() {
    gameChecker = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    w = 0;
    victoryMessage = "";
    currentPlayer = "Player1";
    q = "";
    p1 = "X";
    p2 = "O";
    imgpath0 = "";
    imgpath1 = "";
    imgpath2 = "";
    imgpath3 = "";
    imgpath4 = "";
    imgpath5 = "";
    imgpath6 = "";
    imgpath7 = "";
    imgpath8 = "";
    initialAColor = Colors.blue;
    initialBcolor = Colors.grey;
    visibilitystate = false;
    ab0 = false;
    ab1 = false;
    ab2 = false;
    ab3 = false;
    ab4 = false;
    ab5 = false;
    ab6 = false;
    ab7 = false;
    ab8 = false;
  }

  void checkVictory() {
    if (w == 0) {
      if (gameChecker[0] == gameChecker[4] &&
          gameChecker[4] == gameChecker[8]) {
        victoryMessage = '$currentPlayer wins!';
        w = 1;
      }

      if (gameChecker[0] == gameChecker[1] &&
          gameChecker[1] == gameChecker[2]) {
        victoryMessage = '$currentPlayer wins!';
        w = 1;
      }

      if (gameChecker[3] == gameChecker[4] &&
          gameChecker[4] == gameChecker[5]) {
        victoryMessage = '$currentPlayer wins!';
        w = 1;
      }

      if (gameChecker[6] == gameChecker[7] &&
          gameChecker[7] == gameChecker[8]) {
        victoryMessage = '$currentPlayer wins!';
        w = 1;
      }

      if (gameChecker[0] == gameChecker[3] &&
          gameChecker[3] == gameChecker[6]) {
        victoryMessage = '$currentPlayer wins!';
        w = 1;
      }

      if (gameChecker[1] == gameChecker[4] &&
          gameChecker[4] == gameChecker[7]) {
        victoryMessage = '$currentPlayer wins!';
        w = 1;
      }

      if (gameChecker[2] == gameChecker[5] &&
          gameChecker[5] == gameChecker[8]) {
        victoryMessage = '$currentPlayer wins!';
        w = 1;
      }

      if (gameChecker[2] == gameChecker[4] &&
          gameChecker[4] == gameChecker[6]) {
        victoryMessage = '$currentPlayer wins!';
        w = 1;
      }
    }
    if (currentPlayer == 'Player1') {
      currentPlayer = "Player2";
    } else {
      currentPlayer = "Player1";
    }
    if (w != 0) {
      visibilitystate = true;
    }
  }

  void changePlayer() {
    if (initialAColor == Colors.blue) {
      initialAColor = Colors.grey;
    } else {
      initialAColor = Colors.blue;
    }
    if (initialBcolor == Colors.grey) {
      initialBcolor = Colors.blue;
    } else {
      initialBcolor = Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('TIC-TAC-TOE!'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 100,
                  width: 150,
                  color: initialAColor,
                  margin: EdgeInsets.fromLTRB(20, 20, 5, 20),
                  child: Center(
                    child: Text('Player1'),
                  ),
                ),
                Container(
                  height: 100,
                  width: 150,
                  color: initialBcolor,
                  margin: EdgeInsets.fromLTRB(20, 20, 5, 20),
                  child: Center(
                    child: Text('Player2'),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[0] = 'X';
                            } else {
                              gameChecker[0] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath0 = 'images/xt.png';
                            } else {
                              imgpath0 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab0 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath0'))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[1] = 'X';
                            } else {
                              gameChecker[1] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath1 = 'images/xt.png';
                            } else {
                              imgpath1 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab1 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath1'))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab2,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[2] = 'X';
                            } else {
                              gameChecker[2] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath2 = 'images/xt.png';
                            } else {
                              imgpath2 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab2 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath2'))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab3,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[3] = 'X';
                            } else {
                              gameChecker[3] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath3 = 'images/xt.png';
                            } else {
                              imgpath3 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab3 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath3'))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab4,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[4] = 'X';
                            } else {
                              gameChecker[4] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath4 = 'images/xt.png';
                            } else {
                              imgpath4 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab4 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath4'))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[5] = 'X';
                            } else {
                              gameChecker[5] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath5 = 'images/xt.png';
                            } else {
                              imgpath5 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab5 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath5'))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab6,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[6] = 'X';
                            } else {
                              gameChecker[6] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath6 = 'images/xt.png';
                            } else {
                              imgpath6 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab6 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath6'))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab7,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[7] = 'X';
                            } else {
                              gameChecker[7] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath7 = 'images/xt.png';
                            } else {
                              imgpath7 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab7 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath7'))),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AbsorbPointer(
                      absorbing: ab8,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (currentPlayer == "Player1") {
                              gameChecker[8] = 'X';
                            } else {
                              gameChecker[8] = 'O';
                            }
                            if (currentPlayer == "Player1") {
                              imgpath8 = 'images/xt.png';
                            } else {
                              imgpath8 = 'images/ot.png';
                            }
                            checkVictory();
                            changePlayer();
                            ab8 = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 5),
                              image: DecorationImage(
                                  image: AssetImage('$imgpath8'))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              width: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Center(
                child: Visibility(
                  visible: visibilitystate,
                  child: Text(
                    '$victoryMessage ',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              width: 70,
              height: 60,
              child: Center(
                child: FlatButton(
                  color: Colors.pink,
                  onPressed: () {
                    setState(() {
                      reset();
                    });
                  },
                  child: Text(
                    'RESET',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
