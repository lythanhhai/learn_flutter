import 'package:basic_crud/controllers/bookcontroller.dart';
import 'package:basic_crud/models/bookmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class addBook extends StatelessWidget {
  addBook({super.key});
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
    return ChangeNotifierProvider.value(
      value: bookcontroller(),
      child: Scaffold(
        body: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Center(
                child: Text(
              "Add new book",
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
                  labelText: 'Enter new name book...',
                ),
                controller: nameBookController,
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
                  labelText: 'Enter some description for new book...',
                ),
                controller: descriptionBookController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<bookcontroller>(
              builder: (_, bookController, __) => TextButton(
                  onPressed: () {
                    // showDialog(
                    //   context: context,
                    //   builder: (context) {
                    //     return AlertDialog(
                    //       // Retrieve the text the that user has entered by using the
                    //       // TextEditingController.
                    //       content: Text(
                    //           '${nameBookController.text} - ${descriptionBookController.text}'),
                    //     );
                    //   },
                    // );
                    bookModel book = bookModel(nameBookController.text,
                        descriptionBookController.text);
                    bookController.AddBookToFireStore(book);
                    // bookController.bbb();
                    // print(bookController.getListBooks());
                    Navigator.pushNamed(context, "/home");
                  },
                  child: const Text("Add")),
            ),
          ],
        ),
      ),
    );
  }
}
