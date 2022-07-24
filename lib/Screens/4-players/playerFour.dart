import 'dart:math';

import 'package:dares/Screens/4-players/4-result.dart';
import 'package:dares/Screens/4-players/playerOne.dart';
import 'package:dares/Screens/4-players/playerTwo.dart';
import 'package:dares/Screens/4-players/playerThree.dart';
import 'package:dares/Screens/main/animationroute.dart';
import 'package:dares/string.dart';

import 'package:flutter/material.dart';

class playerFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayerFour(
      name1: '',
      name2: '',
      name3: '',
      name4: '',
      score1: 0,
      score2: 0,
      score3: 0,
      score4: 0,
    );
  }
}

// ignore: must_be_immutable
class PlayerFour extends StatefulWidget {
  String name1;
  String name2;
  String name3;
  String name4;
  int score1;
  int score2;
  int score3;
  int score4;
  PlayerFour({
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
    required this.score1,
    required this.score2,
    required this.score3,
    required this.score4,
  });
  @override
  State<PlayerFour> createState() => _HomeState();
}

int score4 = 0;
int total = 0;
int number4 = 0;
String loser4 = "";

Random random = new Random();
int randomNumber4 = 1 + random.nextInt(10); //from 1 to 10
List a4 = dares4.skip(randomNumber4).take(10).toList();

int n = a4.length;
int x = 0;
int count = 1;
int count2 = 0;

class _HomeState extends State<PlayerFour> {
  next() {
    setState(() {
      count2 = count++;
      if (count == 11) {
        count = count2;
      }
      number4 += 1;
      total = score4++;
      if (number4 >= n + 1) {
        int randomNumberReset4 = 1 + random.nextInt(10); //from 1 to 10
        a4 = dares4.skip(randomNumber4).take(10).toList();
        randomNumber4 = randomNumberReset4;

        number4 = n - 1;
        score4 = total;
      }
      if (number4 == a4.length) {
        // score4 -= 1;
        int randomNumberReset4 = 1 + random.nextInt(10); //from 1 to 10
        a4 = dares4.skip(randomNumber4).take(10).toList();
        randomNumber4 = randomNumberReset4;

        Navigator.of(context).push(Rotation(
            Page: win(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          name3: '${widget.name3}',
          name4: '${widget.name4}',
          score1: score1,
          score2: score2,
          score3: score3,
          score4: score4,
        )));
      }
    });
  }

  skip() {
    setState(() {
      count2 = count++;
      if (count == 11) {
        count = count2;
      }
      number4 += 1;
      if (number4 >= n + 1) {
        number4 = n - 1;
      }
      // score++;
      if (score4 > 0) {
        score4--;
        if (score4 == 0) {
          int randomNumberReset4 = 1 + random.nextInt(10); //from 1 to 10
          a4 = dares4.skip(randomNumber4).take(10).toList();
          randomNumber4 = randomNumberReset4;

          Navigator.of(context).push(Rotation(
              Page: win(
            name1: '${widget.name1}',
            name2: '${widget.name2}',
            name3: '${widget.name3}',
            name4: '${widget.name4}',
            score1: score1,
            score2: score2,
            score3: score3,
            score4: score4,
          ))); //loose

        }
      }
      if (score4 == 0 && number4 == a4.length) {
        int randomNumberReset4 = 1 + random.nextInt(10); //from 1 to 10
        a4 = dares4.skip(randomNumber4).take(10).toList();
        randomNumber4 = randomNumberReset4;

        Navigator.of(context).push(Rotation(
            Page: win(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          name3: '${widget.name3}',
          name4: '${widget.name4}',
          score1: score1,
          score2: score2,
          score3: score3,
          score4: score4,
        ))); //loose

      }
      if (number4 >= n + 1) {
        int randomNumberReset4 = 1 + random.nextInt(10); //from 1 to 10
        a4 = dares4.skip(randomNumber4).take(10).toList();
        randomNumber4 = randomNumberReset4;

        number4 = n - 1;
        score4 = total;
      }
      if (number4 == a4.length && score4 > 0) {
        int randomNumberReset4 = 1 + random.nextInt(10); //from 1 to 10
        a4 = dares4.skip(randomNumber4).take(10).toList();
        randomNumber4 = randomNumberReset4;

        Navigator.of(context).push(Rotation(
            Page: win(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          name3: '${widget.name3}',
          name4: '${widget.name4}',
          score1: score1,
          score2: score2,
          score3: score3,
          score4: score4,
        )));
      }
    });
  }

  bool shouldPop = false;

  @override
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
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 150)),
              Text(
                "$turn ${widget.name4} ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("$score : ${score4}"),
              SizedBox(
                height: 50,
              ),
              Text("$challenge $count"),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Color.fromARGB(255, 223, 120, 97),
                  elevation: 20,
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 50, 40, 50),
                      child: IndexedStack(
                        index: number4,
                        children: [
                          for (String index in a4) // iterate over your list
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                  child: Text(
                                "$index",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 223, 120, 97),
                            elevation: 10,
                            side: BorderSide(width: 3),
                            shape: StadiumBorder()),
                        onPressed: skip,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                          child: Text(
                            skipBTN,
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        )),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 223, 120, 97),
                          elevation: 10,
                          side: BorderSide(width: 3),
                          shape: StadiumBorder()),
                      onPressed: next,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Text(
                          nextBTN,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      )),
                ],
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
      ),
    ));
  }
}
