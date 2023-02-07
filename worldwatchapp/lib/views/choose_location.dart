import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Choose_Location extends StatelessWidget {
  const Choose_Location({super.key});
  void getData() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("hello");
    });
    Future.delayed(Duration(seconds: 1), () {
      print("hello 2");
    });
    print("hello 3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Choose Location"),
    );
  }
}
