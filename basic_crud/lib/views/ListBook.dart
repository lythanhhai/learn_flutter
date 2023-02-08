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
    return StreamBuilder<QuerySnapshot>(
      stream: _booksStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            // print(document);
            return cardbook(
                name: data["nameBook"],
                des: data["desBook"],
                documentSnapshot: document);
            //  ListTile(
            //   title: Text(data['full_name']),
            //   subtitle: Text(data['company']),
            // );
          }).toList(),
        );

        // if (snapshot.hasData) {
        //   return ListView.builder(
        //     itemCount: snapshot.data!.docs.length,
        //     itemBuilder: (context, index) {
        //       final DocumentSnapshot documentSnapshot =
        //           snapshot.data!.docs[index];
        //       return cardbook(name: documentSnapshot["nameBook"], des: documentSnapshot["desBook"], documentSnapshot: documentSnapshot);
        //     },
        //   );
        // }

        // return const Center(
        //   child: CircularProgressIndicator(),
        // );
      },
    );
  }
}
