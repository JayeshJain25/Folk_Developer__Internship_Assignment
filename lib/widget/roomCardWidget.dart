import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/roomModel.dart';
import '../screen/RoomScreen.dart';

class RoomCardWidget extends StatelessWidget {
  final RoomModel roomModel;

  RoomCardWidget({required this.roomModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => RoomScreen(roomModelData: roomModel)));
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          margin: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                roomModel.assetsImage,
                width: size.width * 0.17,
                height: size.height * 0.07,
                fit: BoxFit.contain,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    roomModel.roomName,
                    style: GoogleFonts.lato(
                        color: HexColor("#393939"),
                        fontSize: 20,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Text(roomModel.light,
                        style: GoogleFonts.lato(
                            color: HexColor("#fca44c"),
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
