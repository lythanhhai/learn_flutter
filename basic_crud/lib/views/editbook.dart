import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class editBook extends StatelessWidget {
  editBook({super.key});
  // get text
  final nameBookController = TextEditingController();
  final descriptionBookController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameBookController.dispose();
    descriptionBookController.dispose();
  }

  final CollectionReference _booksStream =
      FirebaseFirestore.instance.collection('books');

  Future<void> EditBook(
      DocumentSnapshot documentSnapshot, String name, String des) async {
    await _booksStream
        .doc(documentSnapshot!.id)
        .update({'nameBook': name, "desBook": des});
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Edit this book",
            style: TextStyle(fontSize: 19, color: Colors.blueAccent),
          )),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter name book...',
              ),
              controller: nameBookController,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter some description for book...',
              ),
              controller: descriptionBookController,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                EditBook(arguments['document'], nameBookController.text,
                    descriptionBookController.text);
              },
              child: Text("Edit"))
        ],
      ),
    );
  }
}
