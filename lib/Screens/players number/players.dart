import 'package:dares/Screens/main/animationroute.dart';
import 'package:dares/Screens/players%20number/two.dart';
import 'package:dares/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'four.dart';
import 'three.dart';
import 'two.dart';

class Players extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlayersNum();
  }
}

class PlayersNum extends StatefulWidget {
  @override
  State<PlayersNum> createState() => _PlayersNumState();
}

class _PlayersNumState extends State<PlayersNum> {
  Future exitbialog() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: Text(confirm),
        content: Text(confirmMSG),
        actions: [
          ElevatedButton(
            child: Text(exit),
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                elevation: 10,
                side: BorderSide(width: 5),
                shape: StadiumBorder()),
            onPressed: () {
              SystemNavigator.pop();
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 10,
                side: BorderSide(width: 5),
                shape: StadiumBorder()),
            child: Text(continuee),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background1),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 250)),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Color.fromARGB(255, 223, 120, 97),
                elevation: 20,
                clipBehavior: Clip.hardEdge,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4,
                      color: Colors.black, // red as border color
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Text(
                      playersNum,
                      style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 214, 210, 196),
                          elevation: 10,
                          side: BorderSide(width: 3),
                          shape: StadiumBorder()),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context)
                              .push(SlideRight(Page: TwoPlayers()));
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                        child: Text(
                          "2",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 214, 210, 196),
                          elevation: 10,
                          side: BorderSide(width: 3),
                          shape: StadiumBorder()),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context)
                              .push(SlideRight(Page: ThreePlayers()));
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                        child: Text(
                          "3",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 214, 210, 196),
                          elevation: 10,
                          side: BorderSide(width: 3),
                          shape: StadiumBorder()),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context)
                              .push(SlideRight(Page: FourPlayers()));
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                        child: Text(
                          "4",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
      onWillPop: () {
        exitbialog();
        return Future.value(false);
      },
    );
  }
}
