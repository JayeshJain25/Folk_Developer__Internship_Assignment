import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 787),
      height: size.height * 0.075,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "lib/assets/bulb.png",
            width: 25,
            height: 25,
          ),
          Image.asset(
            "lib/assets/icon_home.png",
            width: 25,
            height: 25,
          ),
          Image.asset(
            "lib/assets/icon_settings.png",
            width: 25,
            height: 25,
          ),
        ],
      ),
    );
  }
}
