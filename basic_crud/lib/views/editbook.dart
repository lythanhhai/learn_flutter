import 'package:basic_crud/controllers/bookcontroller.dart';
import 'package:basic_crud/models/bookmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: bookcontroller(),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Text(
              "Edit this book",
              style: TextStyle(fontSize: 19, color: Colors.blueAccent),
            )),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter name book...',
                ),
                controller: nameBookController
                  ..text = arguments['document'].data()['nameBook'],
                onChanged: (value) => {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: TextField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter some description for book...',
                ),
                controller: descriptionBookController
                  ..text = arguments['document'].data()['desBook'],
                onChanged: (value) => {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<bookcontroller>(
              builder: (_, bookController, __) => TextButton(
                  onPressed: () {
                    bookModel book = bookModel(
                      nameBookController.text,
                      descriptionBookController.text,
                    );
                    book.setDocumentSnapshot(arguments['document']);

                    bookController.EditBook(arguments['document'], book);
                    Navigator.pushNamed(context, "/home");
                    // print(
                    //     '${nameBookController.text} - ${descriptionBookController.text}');
                  },
                  child: const Text("Edit")),
            )
          ],
        ),
      ),
    );
  }
}
