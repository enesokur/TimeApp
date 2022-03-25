// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      data = ModalRoute.of(context)!.settings.arguments as Map;
    }
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
              onPressed: () async {
                dynamic dataFromPop =
                    await Navigator.pushNamed(context, "/chooselocation");
                setState(() {
                  data = {
                    "cityName": dataFromPop["cityName"],
                    "currentTime": dataFromPop["currentTime"],
                  };
                });
              },
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
                  data["cityName"],
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
                  data["currentTime"],
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
