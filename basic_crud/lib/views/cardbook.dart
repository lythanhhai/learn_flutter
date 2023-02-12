import 'package:basic_crud/controllers/bookcontroller.dart';
import 'package:basic_crud/views/editbook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class cardbook extends StatelessWidget {
  cardbook(
      {super.key,
      required this.name,
      required this.des,
      required this.documentSnapshot});
  String name;
  String des;
  DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: bookcontroller(),
      child: Card(
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
                  SizedBox(
                    height: 10,
                  ),
                  Text('${name}'),
                  const SizedBox(
                    height: 10,
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
                Consumer<bookcontroller>(
                  builder: (_, bookController, __) => TextButton.icon(
                      onPressed: () {
                        bookController.deleteBook(documentSnapshot.id);
                      },
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      label: const Text(
                        "delete",
                        style: TextStyle(color: Colors.redAccent),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
