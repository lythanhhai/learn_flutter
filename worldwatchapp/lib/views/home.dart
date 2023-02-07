import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: SafeArea(
          child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/choose_location");
              },
              icon: Icon(Icons.edit),
              label: Text("edit location"))),
    );
  }
}
