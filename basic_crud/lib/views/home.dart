import 'package:basic_crud/models/bookmodel.dart';
import 'package:basic_crud/views/ListBook.dart';
import 'package:basic_crud/views/cardbook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:basic_crud/views/ListBook.dart";

class Home extends StatelessWidget {
  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Center(
            child: Container(
          child: Text("Book Management",
              style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "List available book",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/add");
              },
              icon: Icon(
                Icons.add,
              ),
              label: Text("Add book"),
            )
          ],
        ),
        SizedBox(
          height: 30,
        ),
        // Column(
        //   children: listBook.map((e) => cardbook()).toList(),
        // ),
        Container(
          child: ListBook(),
        )
        // ListBook()
      ]),
    );
  }
}
