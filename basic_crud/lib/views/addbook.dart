import 'package:basic_crud/controllers/bookcontroller.dart';
import 'package:basic_crud/models/bookmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class addBook extends StatelessWidget {
  addBook({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final Stream<QuerySnapshot> _booksStream =
      FirebaseFirestore.instance.collection('books').snapshots();
  final nameBookController = TextEditingController();
  final descriptionBookController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameBookController.dispose();
    descriptionBookController.dispose();
  }

  Future<void> AddBookToFireStore(String name, String des) {
    CollectionReference books = firestore.collection('books');
    // FirebaseFirestore.instance.collection('books').snapshots().listen((snapshot) {
    //   books
    //       .add({'nameBook': name, "desBook": des})
    //       .then((value) => print("Add successfully!!!"))
    //       .catchError((err) => print(err));
    //   notifyListeners();
    // });
    // bookcontroller.addBook({
    //   {'nameBook': name, "desBook": des}
    // });
    return books
        .add({'nameBook': name, "desBook": des})
        .then((value) => print("Add successfully!!!"))
        .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Center(
              child: Text(
            "Add new book",
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
                labelText: 'Enter new name book...',
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
                labelText: 'Enter some description for new book...',
              ),
              controller: descriptionBookController,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text(
                          '${nameBookController.text} - ${descriptionBookController.text}'),
                    );
                  },
                );
                AddBookToFireStore(
                    nameBookController.text, descriptionBookController.text);
              },
              child: Text("Add")),
        ],
      ),
    );
  }
}
