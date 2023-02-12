import 'package:basic_crud/controllers/bookcontroller.dart';
import 'package:basic_crud/views/cardbook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListBook extends StatelessWidget {
  final Stream<QuerySnapshot> _booksStream =
      FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: bookcontroller(),
      child: StreamBuilder<QuerySnapshot>(
        stream: _booksStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return Consumer<bookcontroller>(
            builder: (_, bookController, __) => ListView(
              shrinkWrap: true,
              children: bookController
                  .getListBooks()
                  .map<Widget>((data) => cardbook(
                      name: data.getName(),
                      des: data.getDescription(),
                      documentSnapshot: data.getDocumentSnapshot()))
                  .toList(),
              // snapshot.data!.docs.map((DocumentSnapshot document) {
              //   Map<String, dynamic> data =
              //       document.data()! as Map<String, dynamic>;
              //   return cardbook(
              //       name: data["nameBook"],
              //       des: data["desBook"],
              //       documentSnapshot: document);}).toList(),
            ),
          );
        },
      ),
    );
  }
}
