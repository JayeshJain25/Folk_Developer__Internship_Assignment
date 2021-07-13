
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../screen/RoomScreen.dart';

class RoomTopSectionWidget extends StatelessWidget {
  const RoomTopSectionWidget({
    Key? key,
    required this.size,
    required this.widget,
    required AnimationController animController,
    required Animation<Offset> animOffset,
    required String colorValue,
    required double value,
    required Animation<Offset> listOffSet,
  })  : _animController = animController,
        _animOffset = animOffset,
        _colorValue = colorValue,
        _value = value,
        _listOffSet = listOffSet,
        super(key: key);

  final Size size;
  final RoomScreen widget;
  final AnimationController _animController;
  final Animation<Offset> _animOffset;
  final String _colorValue;
  final double _value;
  final Animation<Offset> _listOffSet;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: size.height * 0.4,
      decoration: BoxDecoration(
        color: HexColor("#014f9f"),
        image: DecorationImage(
          image: AssetImage(
            "lib/assets/circles.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.02),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Image.asset(
                            "lib/assets/Icon_arrow_back.png",
                            width: size.width * 0.05,
                            height: size.height * 0.05,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                          width: size.width * 0.3,
                          margin: EdgeInsets.only(right: 30),
                          child: Text(
                            widget.roomModelData.roomName,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  FadeTransition(
                    opacity: _animController,
                    child: SlideTransition(
                      position: _animOffset,
                      child: Container(
                          width: size.width * 0.3,
                          child: Text(
                            widget.roomModelData.light,
                            style: GoogleFonts.lato(
                                color: HexColor("#f5ce55"),
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ],
              ),
              FadeTransition(
                opacity: _animController,
                child: SlideTransition(
                  position: _animOffset,
                  child: Stack(children: <Widget>[
                    Positioned(
                      top: size.height * 0.15,
                      left: size.width * 0.12,
                      child: Container(
                        width: size.width * 0.1,
                        height: size.height * 0.1,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: HexColor(_colorValue).withOpacity(_value),
                              blurRadius: 25.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                10.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          color: HexColor(_colorValue).withOpacity(_value),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Image.asset(
                      "lib/assets/group.png",
                      width: size.width * 0.35,
                      height: size.height * 0.27,
                      fit: BoxFit.contain,
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Container(
            height: 45.0,
            child: FadeTransition(
              opacity: _animController,
              child: SlideTransition(
                position: _listOffSet,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      width: 150.0,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "lib/assets/surface1.png",
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                          Text(
                            "Main Light",
                            style: GoogleFonts.lato(
                                color: HexColor("#043e7f"),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: HexColor("#043e7f"),
                      ),
                      width: 150.0,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "lib/assets/desk.png",
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                          Text(
                            "Desk Lights",
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      width: 150.0,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "lib/assets/bed1.png",
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                          Text(
                            "Bed",
                            style: GoogleFonts.lato(
                                color: HexColor("#003d78"),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}