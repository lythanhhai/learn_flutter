import 'package:flutter/material.dart';
import 'package:worldwatchapp/views/choose_location.dart';
import 'package:worldwatchapp/views/loading.dart';

import 'views/home.dart';
import 'views/loading.dart';
import 'views/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/home",
    routes: {
      "/": (context) => Loading(),
      '/home': (context) => Home(),
      "/choose_location": (context) => Choose_Location(),
    },
  ));
}
