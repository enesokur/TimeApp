// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String image = "";
  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }
    if (data["isDay"]) {
      image = "Day.jpg";
    } else {
      image = "Night.jpg";
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$image"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () async {
                dynamic dataFromPop =
                    await Navigator.pushNamed(context, "/chooselocation");
                setState(() {
                  data = {
                    "cityName": dataFromPop["cityName"],
                    "currentTime": dataFromPop["currentTime"],
                    "isDay": dataFromPop["isDay"],
                  };
                });
              },
              icon: Icon(
                Icons.location_on_rounded,
                size: 25.0,
                color: Colors.white,
              ),
              label: Text(
                "Choose a Location",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 25.0,
                  color: Colors.white,
                  fontFamily: "NotoSans",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data["cityName"],
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontFamily: "NotoSans",
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  data["currentTime"],
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    letterSpacing: 1.0,
                    fontFamily: "NotoSans",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
