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
  Widget build(BuildContext context) {
    instance.calculateTime();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(instance.cityName),
          Text(instance.currentTime!),
        ],
      )),
    );
  }
}
