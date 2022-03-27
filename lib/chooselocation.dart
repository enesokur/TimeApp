// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'locations.dart';

class ChooseLocation extends StatelessWidget {
  final List<Locations> locationList = [
    Locations(url: "Europe/Istanbul", cityName: "Istanbul"),
    Locations(url: "Europe/Moscow", cityName: "Moscow"),
    Locations(url: "Europe/London", cityName: "London"),
    Locations(url: "Europe/Berlin", cityName: "Berlin"),
    Locations(url: "Europe/Madrid", cityName: "Madrid"),
    Locations(url: "Europe/Kiev", cityName: "Kiev"),
    Locations(url: "Europe/Rome", cityName: "Rome"),
    Locations(url: "Europe/Paris", cityName: "Paris"),
    Locations(url: "America/New_York", cityName: "New York"),
    Locations(url: "Europe/Budapest", cityName: "Budapest"),
    Locations(url: "Europe/Warsaw", cityName: "Warsaw"),
    Locations(url: "Asia/Baku", cityName: "Baku"),
    Locations(url: "Europe/Helsinki", cityName: "Helsinki"),
    Locations(url: "Asia/Tokyo", cityName: "Tokyo"),
    Locations(url: "Asia/Dubai", cityName: "Dubai"),
    Locations(url: "Asia/Tehran", cityName: "Tehran"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Location"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: locationList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(locationList[index].cityName),
            onTap: () async {
              Locations instance = locationList[index];
              await instance.calculateTime();
              Navigator.pop(context, {
                "cityName": instance.cityName,
                "currentTime": instance.currentTime,
                "isDay": instance.isDay,
              });
            },
            tileColor: Colors.orange[200],
            leading: Icon(Icons.location_city_rounded),
          );
        },
      ),
    );
  }
}
