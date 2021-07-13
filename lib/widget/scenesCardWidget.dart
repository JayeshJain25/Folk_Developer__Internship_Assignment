import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/scenesModel.dart';

class ScenesCardWidget extends StatelessWidget {
  final ScenesModel scenesModel;

  const ScenesCardWidget({Key? key, required this.scenesModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.4,
      height: size.height*0.08,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                HexColor(scenesModel.colorCode[0]),
                HexColor(scenesModel.colorCode[1]),
              ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            scenesModel.assetsImage,
            width: size.width * 0.06,
            height: size.height * 0.05,
            fit: BoxFit.contain,
          ),
          Text(
            scenesModel.scenesName,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
