import 'package:basic_crud/views/editbook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class cardbook extends StatelessWidget {
  cardbook(
      {super.key,
      required this.name,
      required this.des,
      required this.documentSnapshot});
  String name;
  String des;
  DocumentSnapshot documentSnapshot;
  final CollectionReference _booksStream =
      FirebaseFirestore.instance.collection('books');

  Future<void> deleteBook(String bookId) async {
    await _booksStream.doc(bookId).delete();

    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${name}'),
                const SizedBox(
                  height: 20,
                ),
                Text('${des}'),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, "/edit",
                        arguments: {"document": documentSnapshot});
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => editBook(
                    //         documentSnapshot: documentSnapshot,
                    //       ),
                    //     ));
                  },
                  icon: const Icon(Icons.edit,
                      color: Color.fromARGB(255, 71, 169, 248)),
                  label: const Text("edit")),
              TextButton.icon(
                  onPressed: () {
                    deleteBook(documentSnapshot.id);
                  },
                  icon: const Icon(Icons.delete, color: Colors.redAccent),
                  label: const Text("delete"))
            ],
          )
        ],
      ),
    );
  }
}
