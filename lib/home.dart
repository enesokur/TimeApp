// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'locations.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Locations instance = Locations(url: "Europe/Istanbul", cityName: "Istanbul");
  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    await instance.calculateTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Day.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.location_on_rounded,
                size: 15,
              ),
              label: Text(
                "Choose a Location",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontSize: 15.0,
                  color: Colors.blue,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  instance.cityName,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  instance.currentTime!,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blue,
                    letterSpacing: 1.0,
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
