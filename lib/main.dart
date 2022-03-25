// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'home.dart';
import 'chooselocation.dart';
import 'loading.dart';

void main() {
  runApp(MaterialApp(
    home: Loading(),
    routes: {
      "/chooselocation": (BuildContext context) => ChooseLocation(),
      "/home": (BuildContext context) => Home()
    },
  ));
}
