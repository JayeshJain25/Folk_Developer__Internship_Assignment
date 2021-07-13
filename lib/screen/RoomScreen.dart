import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intermship_assignment/widget/roomTopSectionWidget.dart';

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

    _color2 = Tween<Offset>(begin: const Offset(-1, 0.0), end: Offset.zero)
        .animate(curve);

    _color3 = Tween<Offset>(begin: const Offset(-2, 0.0), end: Offset.zero)
        .animate(curve);

    _color4 = Tween<Offset>(begin: const Offset(-1.7, 0.0), end: Offset.zero)
        .animate(curve);

    _color5 = Tween<Offset>(begin: const Offset(-3.1, 0.0), end: Offset.zero)
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
          RoomTopSectionWidget(
              size: size,
              widget: widget,
              animController: _animController,
              animOffset: _animOffset,
              colorValue: _colorValue,
              value: _value,
              listOffSet: _listOffSet),
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
