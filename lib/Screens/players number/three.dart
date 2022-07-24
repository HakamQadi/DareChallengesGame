import 'package:dares/Screens/3-players/playerOne.dart';
import 'package:dares/Screens/main/animationroute.dart';
import 'package:dares/string.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Three extends StatelessWidget {
  const Three({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThreePlayers();
  }
}

class ThreePlayers extends StatefulWidget {
  ThreePlayers({Key? key}) : super(key: key);

  @override
  State<ThreePlayers> createState() => _TowPlayersState();
}

class _TowPlayersState extends State<ThreePlayers> {
  TextEditingController playerOneController = TextEditingController();
  TextEditingController playerTwoController = TextEditingController();
  TextEditingController playerThreeController = TextEditingController();

  FocusNode focus = FocusNode();
  String errMSG = "";
  Color errCLR = Colors.black;
  Color errCLR2 = Color.fromARGB(255, 122, 134, 182);
  Icon errICN = Icon(Icons.error);
  Color icnCLR = Color.fromARGB(0, 255, 0, 0);
  String name1 = "";
  String name2 = "";
  String name3 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(255, 24, 116, 152),
      // ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background22.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 300,
                ),
                Container(
                  child: Container(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: GoogleFonts.notoKufiArabic(
                            fontSize: 12, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 214, 210, 196),
                          filled: true,
                          suffixIcon: Icon(
                            Icons.error_outline_outlined,
                            color: icnCLR,
                          ),
                          suffixIconColor: Colors.red,
                          contentPadding: EdgeInsets.all(15),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            borderSide: BorderSide(width: 3, color: errCLR),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            borderSide: BorderSide(width: 3, color: errCLR2),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                          labelText: playerOneName,
                        ),
                        controller: playerOneController,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          style: GoogleFonts.notoKufiArabic(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(255, 214, 210, 196),
                            filled: true,
                            suffixIcon: Icon(
                              Icons.error_outline_outlined,
                              color: icnCLR,
                            ),
                            suffixIconColor: Colors.red,
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                              borderSide: BorderSide(width: 3, color: errCLR),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                              borderSide: BorderSide(width: 3, color: errCLR2),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            labelText: playerTwoName,
                          ),
                          controller: playerTwoController,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      style: GoogleFonts.notoKufiArabic(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 214, 210, 196),
                        filled: true,
                        suffixIcon: Icon(
                          Icons.error_outline_outlined,
                          color: icnCLR,
                        ),
                        suffixIconColor: Colors.red,
                        contentPadding: EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          borderSide: BorderSide(width: 3, color: errCLR),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          borderSide: BorderSide(width: 3, color: errCLR2),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                        labelText: playerThreeName,
                      ),
                      controller: playerThreeController,
                    ),
                  ),
                ),
                Text(
                  errMSG,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(200, 120, 0, 0),
                  child: ElevatedButton(
                    focusNode: focus,
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 214, 210, 196),
                        elevation: 10,
                        side: BorderSide(width: 3),
                        shape: StadiumBorder()),
                    onPressed: () {
                      focus.nextFocus();
                      focus.nextFocus();
                      focus.nextFocus();
                      setState(() {
                        if (playerOneController.text != "" &&
                            playerOneController.text != " " &&
                            playerTwoController.text != "" &&
                            playerTwoController.text != " " &&
                            playerThreeController.text != "" &&
                            playerThreeController.text != " ") {
                          name1 = playerOneController.text;
                          name2 = playerTwoController.text;
                          name3 = playerThreeController.text;
                          Navigator.of(context).push(SlideRight(
                              Page: PlayerOne(
                            name1: name1,
                            name2: name2,
                            name3: name3,
                            score1: score1,
                          )));

                          errMSG = "";
                          playerOneController.clear();
                          playerTwoController.clear();
                          playerThreeController.clear();
                          errCLR = Color.fromARGB(255, 24, 116, 152);
                          icnCLR = Color.fromARGB(0, 255, 0, 0);
                          errCLR2 = Colors.greenAccent;
                        } else {
                          setState(() {
                            errMSG = "please enter your name";
                            errCLR = Colors.red;
                            errCLR2 = Colors.red;
                            icnCLR = Color.fromARGB(255, 255, 0, 0);
                          });
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        play,
                        style: GoogleFonts.notoKufiArabic(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
