import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/roomModel.dart';
import '../widget/bottomNavigation.dart';
import '../widget/roomCardWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: size.height,
          ),
          Container(
            decoration: BoxDecoration(
              color: HexColor("#014f9f"),
              image: DecorationImage(
                image: AssetImage(
                  "lib/assets/circles.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(20),
            height: size.height * 0.24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    width: size.width * 0.3,
                    child: Text(
                      "Control Panel",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )),
                Image.asset(
                  "lib/assets/user.png",
                  width: size.width * 0.25,
                  height: size.height * 0.25,
                ),
              ],
            ),
          ),
          Container(
            margin:  EdgeInsets.only(top: size.height * 0.21),
            padding: const EdgeInsets.all(25),
            width: size.width,
            height: size.height * 0.75,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "All Rooms",
                  style: TextStyle(
                      color: HexColor("#014f9f"),
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: size.height * 0.65,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    children: List.generate(roomModelList.length, (index) {
                      return RoomCardWidget(roomModel: roomModelList[index]);
                    }),
                  ),
                )
              ],
            ),
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}
