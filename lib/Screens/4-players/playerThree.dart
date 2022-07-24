import 'package:dares/Screens/4-players/playerOne.dart';
import 'package:dares/Screens/4-players/playerTwo.dart';
import 'package:dares/Screens/4-players/playerFour.dart';
import 'package:dares/Screens/main/animationroute.dart';
import 'package:dares/string.dart';

import 'dart:math';

import 'package:flutter/material.dart';

class playerThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayerThree(
      name1: '',
      name2: '',
      name3: '',
      name4: '',
      score1: 0,
      score2: 0,
      score3: 0,
    );
  }
}

// ignore: must_be_immutable
class PlayerThree extends StatefulWidget {
  String name1;
  String name2;
  String name3;
  String name4;
  int score1;
  int score2;
  int score3;
  PlayerThree({
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
    required this.score1,
    required this.score2,
    required this.score3,
  });
  @override
  State<PlayerThree> createState() => _HomeState();
}

int score3 = 0;
int total = 0;
int number3 = 0;
String loser3 = "";

Random random = new Random();
int randomNumber3 = 1 + random.nextInt(10); //from 1 to 10
List a3 = dares3.skip(randomNumber3).take(10).toList();

int n = a3.length;
int x = 0;
int count = 1;
int count2 = 0;

class _HomeState extends State<PlayerThree> {
  next() {
    setState(() {
      count2 = count++;
      if (count == 11) {
        count = count2;
      }
      number3 += 1;
      total = score3++;
      if (number3 >= n + 1) {
        int randomNumberReset3 = 1 + random.nextInt(10); //from 1 to 10
        a3 = dares3.skip(randomNumber3).take(10).toList();
        randomNumber3 = randomNumberReset3;

        number3 = n - 1;
        score3 = total;
      }
      if (number3 == a3.length) {
        // score3 -= 1;
        int randomNumberReset3 = 1 + random.nextInt(10); //from 1 to 10
        a3 = dares3.skip(randomNumber3).take(10).toList();
        randomNumber3 = randomNumberReset3;

        Navigator.of(context).push(Rotation(
            Page: PlayerFour(
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
      number3 += 1;
      if (number3 >= n + 1) {
        number3 = n - 1;
      }
      if (score3 > 0) {
        score3--;
        if (score3 == 0) {
          int randomNumberReset3 = 1 + random.nextInt(10); //from 1 to 10
          a3 = dares3.skip(randomNumber3).take(10).toList();
          randomNumber3 = randomNumberReset3;

          Navigator.of(context).push(Rotation(
              Page: PlayerFour(
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
      if (score3 == 0 && number3 == a3.length) {
        int randomNumberReset3 = 1 + random.nextInt(10); //from 1 to 10
        a3 = dares3.skip(randomNumber3).take(10).toList();
        randomNumber3 = randomNumberReset3;

        Navigator.of(context).push(Rotation(
            Page: PlayerFour(
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
      if (number3 >= n + 1) {
        int randomNumberReset3 = 1 + random.nextInt(10); //from 1 to 10
        a3 = dares3.skip(randomNumber3).take(10).toList();
        randomNumber3 = randomNumberReset3;

        number3 = n - 1;
        score3 = total;
      }
      if (number3 == a3.length && score3 > 0) {
        int randomNumberReset3 = 1 + random.nextInt(10); //from 1 to 10
        a3 = dares3.skip(randomNumber3).take(10).toList();
        randomNumber3 = randomNumberReset3;

        Navigator.of(context).push(Rotation(
            Page: PlayerFour(
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
                "$turn ${widget.name3} ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("$score : ${score3}"),
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
                        index: number3,
                        children: [
                          for (String index in a3) // iterate over your list
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
