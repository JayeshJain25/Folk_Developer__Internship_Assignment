import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../model/roomModel.dart';
import '../model/scenesModel.dart';
import '../widget/bottomNavigation.dart';
import '../widget/scenesCardWidget.dart';

class RoomScreen extends StatefulWidget {
  final RoomModel roomModelData;

  RoomScreen({required this.roomModelData});

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> with TickerProviderStateMixin {
  double _value = 1.0;
  String _colorValue = "#ff9b9d";

  late AnimationController _animController;
  late Animation<Offset> _animOffset;
  late Animation<Offset> _listOffSet;
  late Animation<Offset> _scenesOffSet;
  late Animation<Offset> _color2;
  late Animation<Offset> _color3;
  late Animation<Offset> _color4;
  late Animation<Offset> _color5;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, -0.35), end: Offset.zero)
            .animate(curve);

    _listOffSet =
        Tween<Offset>(begin: const Offset(0.35, 0.0), end: Offset.zero)
            .animate(curve);

    _scenesOffSet =
        Tween<Offset>(begin: const Offset(-0.35, 0.0), end: Offset.zero)
            .animate(curve);

    _color2 =
        Tween<Offset>(begin: const Offset(-1, 0.0), end: Offset.zero)
            .animate(curve);

    _color3 =
        Tween<Offset>(begin: const Offset(-2, 0.0), end: Offset.zero)
            .animate(curve);

    _color4 =
        Tween<Offset>(begin: const Offset(-1.7, 0.0), end: Offset.zero)
            .animate(curve);

    _color5 =
        Tween<Offset>(begin: const Offset(-3.1, 0.0), end: Offset.zero)
            .animate(curve);

    _animController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animController.dispose();
  }

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
                                    color: HexColor(_colorValue)
                                        .withOpacity(_value),
                                    blurRadius: 25.0, // soften the shadow
                                    spreadRadius: 5.0, //extend the shadow
                                    offset: Offset(
                                      2.0, // Move to right 10  horizontally
                                      10.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color:
                                    HexColor(_colorValue).withOpacity(_value),
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
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.35),
            padding: EdgeInsets.all(25),
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
                  "Intensity",
                  style: TextStyle(
                      color: HexColor("#014f9f"),
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      "lib/assets/solution2.png",
                      width: size.width * 0.1,
                      height: size.height * 0.1,
                    ),
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: HexColor("#fcd46a"),
                          inactiveTrackColor: HexColor("#f4ebd5"),
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 4.0,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          thumbColor: HexColor("#f3e3bb"),
                          overlayColor: Colors.red.withAlpha(32),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28.0),
                          tickMarkShape: RoundSliderTickMarkShape(),
                          activeTickMarkColor: HexColor("#fcd46a"),
                          inactiveTickMarkColor: HexColor("#f4ebd5"),
                          valueIndicatorShape:
                              PaddleSliderValueIndicatorShape(),
                          valueIndicatorColor: HexColor("#f3e3bb"),
                          valueIndicatorTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Slider(
                          value: _value,
                          min: 0.0,
                          max: 1.0,
                          divisions: 10,
                          label: '$_value',
                          onChanged: (value) {
                            setState(
                              () {
                                _value = value;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Image.asset(
                      "lib/assets/solution.png",
                      width: size.width * 0.1,
                      height: size.height * 0.1,
                    ),
                  ],
                ),
                Text(
                  "Colors",
                  style: TextStyle(
                      color: HexColor("#014f9f"),
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorValue = "#ff9b9d";
                          });
                        },
                        child: Container(
                          width: size.width * 0.1,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            color: HexColor("#ff9b9d"),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorValue = "#90eba4";
                          });
                        },
                        child: SlideTransition(
                          position: _scenesOffSet,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              color: HexColor("#90eba4"),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorValue = "#8dcae9";
                          });
                        },
                        child: SlideTransition(
                          position: _color2,
                          child: Container(
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              color: HexColor("#8dcae9"),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorValue = "#a096e6";
                          });
                        },
                        child: SlideTransition(
                          position: _color2,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              color: HexColor("#a096e6"),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorValue = "#de94e7";
                          });
                        },
                        child: SlideTransition(
                          position: _color3,
                          child: Container(
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              color: HexColor("#de94e7"),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _colorValue = "#eecf98";
                          });
                        },
                        child: SlideTransition(
                          position: _color4,
                          child: Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              color: HexColor("#eecf98"),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      SlideTransition(
                        position: _color5,
                        child: Container(
                          width: size.width * 0.1,
                          height: size.height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            "lib/assets/plus.png",
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Scenes",
                  style: TextStyle(
                      color: HexColor("#014f9f"),
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                    height: size.height * 0.29,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ScenesCardWidget(scenesModel: scenesModelList[0]),
                            SlideTransition(
                                position: _scenesOffSet,
                                child: ScenesCardWidget(
                                    scenesModel: scenesModelList[1]))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ScenesCardWidget(scenesModel: scenesModelList[2]),
                            SlideTransition(
                                position: _scenesOffSet,
                                child: ScenesCardWidget(
                                    scenesModel: scenesModelList[3]))
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.304,
            right: size.width * 0.07,
            child: Container(
              width: size.width * 0.1,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 2.0,
                  ),
                ],
              ),
              child: Image.asset(
                "lib/assets/Icon_power_off.png",
                width: size.width * 0.1,
                height: size.height * 0.1,
              ),
            ),
          ),
          BottomNavigation(),
        ],
      ),
    );
  }
}
