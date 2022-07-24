import 'dart:math';

import 'package:dares/Screens/4-players/playerTwo.dart';
import 'package:dares/Screens/main/animationroute.dart';
import 'package:dares/string.dart';

import 'package:flutter/material.dart';

class playerOne extends StatelessWidget {
  const playerOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlayerOne(
      name1: '',
      name2: '',
      name3: '',
      name4: '',
      score1: 0,
    );
  }
}

// ignore: must_be_immutable
class PlayerOne extends StatefulWidget {
  String name1;
  String name2;
  String name3;
  String name4;
  int score1;
  PlayerOne({
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
    required this.score1,
  });
  @override
  State<PlayerOne> createState() => _HomeState();
}

int score1 = 0;
int total = 0;
int number = 0;
String loser = "";

Random random = new Random();
int randomNumber = 1 + random.nextInt(10); //from 1 to 10
List a = dares.skip(randomNumber).take(10).toList();

int n = a.length;
int x = 0;
int count = 1;
int count2 = 0;

class _HomeState extends State<PlayerOne> {
  next() {
    setState(() {
      count2 = count++;
      if (count == 11) {
        count = count2;
      }
      number += 1;
      total = score1++;
      if (number >= n + 1) {
        int randomNumberReset1 = 1 + random.nextInt(10); //from 1 to 10
        a = dares.skip(randomNumber).take(10).toList();
        randomNumber = randomNumberReset1;

        number = n - 1;
        score1 = total;
      }
      if (number == a.length) {
        // score1 -= 1;
        int randomNumberReset1 = 1 + random.nextInt(10); //from 1 to 10
        a = dares.skip(randomNumber).take(10).toList();
        randomNumber = randomNumberReset1;

        Navigator.of(context).push(Rotation(
            Page: PlayerTwo(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          name3: '${widget.name3}',
          name4: '${widget.name4}',
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
      number += 1;
      if (number >= n + 1) {
        //     تخطي لكن النقاط صفر بعد التجميع
        number = n - 1;
      }
      // score++;
      if (score1 > 0) {
        //   تخطي لكن مع نقاط
        score1--;
        if (score1 == 0) {
          //   تخطي كامل يعني ولا حصلت على اي نقطة
          int randomNumberReset1 = 1 + random.nextInt(10); //from 1 to 10
          a = dares.skip(randomNumber).take(10).toList();
          randomNumber = randomNumberReset1;

          Navigator.of(context).push(Rotation(
              Page: PlayerTwo(
            name1: '${widget.name1}',
            name2: '${widget.name2}',
            name3: '${widget.name3}',
            name4: '${widget.name4}',
          ))); //loose

        }
      }
      if (score1 == 0 && number == a.length) {
        int randomNumberReset1 = 1 + random.nextInt(10); //from 1 to 10
        a = dares.skip(randomNumber).take(10).toList();
        randomNumber = randomNumberReset1;

        Navigator.of(context).push(Rotation(
            Page: PlayerTwo(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          name3: '${widget.name3}',
          name4: '${widget.name4}',
        ))); //loose

      }
      if (number >= n + 1) {
        int randomNumberReset1 = 1 + random.nextInt(10); //from 1 to 10
        a = dares.skip(randomNumber).take(10).toList();
        randomNumber = randomNumberReset1;

        number = n - 1;
        score1 = total;
      }
      if (number == a.length && score1 > 0) {
        int randomNumberReset1 = 1 + random.nextInt(10); //from 1 to 10
        a = dares.skip(randomNumber).take(10).toList();
        randomNumber = randomNumberReset1;

        Navigator.of(context).push(Rotation(
            Page: PlayerTwo(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          name3: '${widget.name3}',
          name4: '${widget.name4}',
        ))); //win
        // isEnabled2 = false;
        // isEnabled = true;
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
                "$turn ${widget.name1} ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("$score : ${score1}"),
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
                        index: number,
                        children: [
                          for (String index in a) // iterate over your list
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
