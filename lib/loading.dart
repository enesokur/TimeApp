// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'locations.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Locations instance = Locations(url: "Europe/Istanbul", cityName: "Istanbul");

  void calculateTimeForHome() async {
    await instance.calculateTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "cityName": instance.cityName,
      "currentTime": instance.currentTime,
      "isDay": instance.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    calculateTimeForHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Text(
          "LOADING..",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.0,
            fontSize: 25.0,
            fontFamily: "NotoSans",
          ),
        ),
      ),
    );
  }
}
