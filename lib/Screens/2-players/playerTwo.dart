import 'dart:math';

import 'package:dares/Screens/2-players/playerOne.dart';
import 'package:dares/Screens/2-players/result.dart';
import 'package:dares/Screens/main/animationroute.dart';
import 'package:dares/string.dart';
import 'package:flutter/material.dart';

class playerTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayerTwo(
      name1: '',
      name2: '',
    );
  }
}

// ignore: must_be_immutable
class PlayerTwo extends StatefulWidget {
  String name1;
  String name2;

  PlayerTwo({
    required this.name1,
    required this.name2,
  });
  @override
  State<PlayerTwo> createState() => _HomeState();
}

int score2 = 0;
int total = 0;
int number2 = 0;
String loser2 = "";

Random random = new Random();
int randomNumber2 = 1 + random.nextInt(10); //from 1 to 10
List a2 = dares2.skip(randomNumber2).take(10).toList();

int n = a2.length;
int x = 0;
int count = 1;
bool shouldPop = false;

class _HomeState extends State<PlayerTwo> {
  next() {
    setState(() {
      count2 = count++;
      if (count == 11) {
        count = count2;
      }

      number2 += 1;
      total = score2++;
      if (number2 >= n + 1) {
        int randomNumberReset2 = 1 + random.nextInt(10); //from 1 to 10
        a2 = dares2.skip(randomNumber2).take(10).toList();
        randomNumber2 = randomNumberReset2;

        number2 = n - 1;
        score2 = total;
      }
      if (number2 == a2.length) {
        // score2 -= 1;
        int randomNumberReset2 = 1 + random.nextInt(10); //from 1 to 10
        a2 = dares2.skip(randomNumber2).take(10).toList();
        randomNumber2 = randomNumberReset2;
        Navigator.of(context).push(Rotation(
            Page: win(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          score1: score1,
          score2: score2,
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
      number2 += 1;
      if (number2 >= n + 1) {
        //     تخطي لكن النقاط صفر بعد التجميع
        number2 = n - 1;
      }
      // score++;
      if (score2 > 0) {
        //   تخطي لكن مع نقاط
        score2--;
        if (score2 == 0) {
          //   تخطي كامل يعني ولا حصلت على اي نقطة
          int randomNumberReset2 = 1 + random.nextInt(10); //from 1 to 10
          a2 = dares2.skip(randomNumber2).take(10).toList();
          randomNumber2 = randomNumberReset2;
          Navigator.of(context).push(Rotation(
              Page: win(
            name1: '${widget.name1}',
            name2: '${widget.name2}',
            score1: score1,
            score2: score2,
          ))); //loose

        }
      }
      if (score2 == 0 && number2 == a2.length) {
        int randomNumberReset2 = 1 + random.nextInt(10); //from 1 to 10
        a2 = dares2.skip(randomNumber2).take(10).toList();
        randomNumber2 = randomNumberReset2;
        Navigator.of(context).push(Rotation(
            Page: win(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          score1: score1,
          score2: score2,
        ))); //loose

      }
      if (number2 >= n + 1) {
        int randomNumberReset2 = 1 + random.nextInt(10); //from 1 to 10
        a2 = dares2.skip(randomNumber2).take(10).toList();
        randomNumber2 = randomNumberReset2;
        number2 = n - 1;
        score2 = total;
      }
      if (number2 == a2.length && score2 > 0) {
        int randomNumberReset2 = 1 + random.nextInt(10); //from 1 to 10
        a2 = dares2.skip(randomNumber2).take(10).toList();
        randomNumber2 = randomNumberReset2;
        Navigator.of(context).push(Rotation(
            Page: win(
          name1: '${widget.name1}',
          name2: '${widget.name2}',
          score1: score1,
          score2: score2,
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
                "$turn ${widget.name2} ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "$score : ${score2}",
              ),
              SizedBox(
                height: 50,
              ),
              Text("$challenge $count"),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
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
                        index: number2,
                        children: [
                          for (String index in a2) // iterate over your list
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
