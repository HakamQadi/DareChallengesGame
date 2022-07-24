import 'package:dares/Screens/3-players/playerTwo.dart';
import 'package:dares/Screens/3-players/playerOne.dart';
import 'package:dares/Screens/3-players/playerThree.dart';
import 'package:dares/Screens/players%20number/players.dart';
import 'package:dares/Screens/main/animationroute.dart';
import 'package:dares/string.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Win extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return win(
      name1: '',
      name2: '',
      name3: '',
      score1: 0,
      score2: 0,
      score3: 0,
    );
  }
}

// ignore: must_be_immutable
class win extends StatefulWidget {
  String name1;
  String name2;
  String name3;
  int score1;
  int score2;
  int score3;

  win({
    required this.name1,
    required this.name2,
    required this.name3,
    required this.score1,
    required this.score2,
    required this.score3,
  });

  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  bool shouldPop = false;
  String winName = "";
  String draw = "";
  String draw1 = "";
  String txt = "";
  int draw2 = 0;
  int winScore = 0;
  int loseScore = 0;
  Color winCLR1 = Color.fromARGB(255, 243, 235, 234);
  Color winCLR2 = Color.fromARGB(255, 243, 235, 234);
  Color winCLR3 = Color.fromARGB(255, 243, 235, 234);
  Color scoreCLR = Colors.amber;

  @override
  void initState() {
    if (score1 > score2 && score1 > score3) {
      winName = widget.name1;
      winCLR1 = Colors.greenAccent;
      winScore = widget.score1;
      // scoreCLR = Colors.amber;

    } else if (score2 > score1 && score2 > score3) {
      winCLR2 = Colors.greenAccent;
      winName = widget.name2;
      winScore = widget.score2;
      // scoreCLR = Colors.amber;

    } else if (score3 > score1 && score3 > score2) {
      if (score3 == score1 || score3 == score2) {
        winCLR3 = Colors.greenAccent;
        winName = widget.name3;
        winScore = widget.score3;
        // scoreCLR = Colors.amber;
      }
    } else {
      if (score1 == score2 && (score1 > score3 || score2 > score3)) {
        winCLR2 = Colors.amber;
        winCLR1 = Colors.amber;
      } else if (score3 == score1 && (score3 > score2 || score1 > score2)) {
        winCLR1 = Colors.amber;
        winCLR3 = Colors.amber;
      } else if (score3 == score2 && (score3 > score1 || score2 > score1)) {
        winCLR2 = Colors.amber;
        winCLR3 = Colors.amber;
      } else if (score1 == score2 &&
          score1 == score3 &&
          score3 == score2 &&
          score3 == score1) {
        winCLR1 = Colors.amber;
        winCLR3 = Colors.amber;
        winCLR2 = Colors.amber;
      }
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background2),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                ),
                color: Color.fromARGB(255, 223, 120, 97),
                elevation: 20,
                clipBehavior: Clip.hardEdge,
                child: Container(
                  // height: 70,
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140, ////////////////////////////
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: winCLR1,
                        clipBehavior: Clip.hardEdge,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IntrinsicHeight(
                              child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                style: TextStyle(fontSize: 25),
                                "${widget.score1}",
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Text(
                                "${widget.name1}",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: winCLR2,
                        clipBehavior: Clip.hardEdge,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IntrinsicHeight(
                              child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "${widget.score2}",
                                style: TextStyle(fontSize: 25),
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Text(
                                "${widget.name2}",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: winCLR3,
                        clipBehavior: Clip.hardEdge,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IntrinsicHeight(
                              child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "${widget.score3}",
                                style: TextStyle(fontSize: 25),
                              ),
                              VerticalDivider(
                                thickness: 3,
                              ),
                              Text(
                                "${widget.name3}",
                                style: TextStyle(fontSize: 25),
                              ),
                            ],
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 130, /////////////////////////////////
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            //
            //
            //
            //
            //
            //
            //
            //
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 214, 210, 196),
                  elevation: 10,
                  side: BorderSide(width: 3),
                  shape: StadiumBorder()),
              onPressed: () {
                setState(() {
                  Navigator.of(context).pushAndRemoveUntil(
                    SlideRight(Page: PlayersNum()),
                    (route) => false,
                  );
                  score1 = 0;
                  if (score1 == 0) {
                    number = 0;
                  }
                  if (number == (dares.length) - 1) {
                    number = 0;
                  }
                  score2 = 0;
                  if (score2 == 0) {
                    number2 = 0;
                  }
                  if (number2 == (dares2.length) - 1) {
                    number2 = 0;
                  }
                  score3 = 0;
                  if (score3 == 0) {
                    number3 = 0;
                  }
                  if (number3 == (dares3.length) - 1) {
                    number3 = 0;
                  }
                  loser = "";
                  // isEnabled = false;
                  // isEnabled2 = true;
                  // isEnabled2 = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Text(
                  "$playAgainBTN",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
            WillPopScope(
              onWillPop: () async {
                return shouldPop;
              },
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
