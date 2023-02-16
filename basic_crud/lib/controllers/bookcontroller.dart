import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/bookmodel.dart';

class bookcontroller extends ChangeNotifier {
  late List<bookModel> books = [];

  bookcontroller() {
    // FirebaseFirestore.instance
    //     .collection('books')
    //     .snapshots()
    //     .listen((snapshot) async {
    //   List<bookModel> list = [];
    //   for (var doc in snapshot.docs) {
    //     bookModel book =
    //         bookModel(doc.data()["nameBook"], doc.data()["desBook"]);
    //     book.setDocumentSnapshot(doc);
    //     list.add(book);
    //   }
    //   books = list;
    //   notifyListeners();
    // });
  }

  List<bookModel> getListBooks() {
    // try {
    //   final FirebaseAuth auth = FirebaseAuth.instance;
    //   final User? user = auth.currentUser;
    //   final uid = user?.uid;
    //   String currentIdDoc = "";
    //   await FirebaseFirestore.instance.collection("users").get().then((array) {
    //     for (int i = 0; i < array.docs.length; i++) {
    //       if (uid == array.docs[i].data()["id"]) {
    //         currentIdDoc = array.docs[i].id;
    //       }
    //       // print(array.docs[i].data());
    //       // print(array.docs[i].id);
    //     }
    //   });
    //   final result = await FirebaseFunctions.instance
    //       .httpsCallable('getBook')
    //       .call({"id": currentIdDoc});
    //   String _response = result.data as String;
    //   print(_response);
    // } on FirebaseFunctionsException catch (error) {
    //   print(error.code);
    //   print(error.details);
    //   print(error.message);
    // }
    return books;
  }

  getLengthListBooks() {
    return books.length;
  }

  // add book to firestore
  void AddBookToFireStore(bookModel book) async {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference books = firestore.collection('books');

    // // notifyListeners();
    // await books
    //     .add({'nameBook': book.getName(), "desBook": book.getDescription()});
    // // updateListBook();

    // C1: onCall
    // HttpsCallable callable =
    //     FirebaseFunctions.instance.httpsCallable("addBook");
    // callable({'nameBook': book.getName(), 'desBook': book.getDescription()})
    //     .then((res) => {print('oke: ${res.data}')})
    //     .catchError((err) => {print("err: " + err.toString())});

    // C2: onRequest
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    String currentIdDoc = "";
    FirebaseFirestore.instance.collection("users").get().then((array) async {
      for (int i = 0; i < array.docs.length; i++) {
        if (uid == array.docs[i].data()["id"]) {
          currentIdDoc = array.docs[i].id;
        }
        // print(array.docs[i].data());
        // print(array.docs[i].id);
      }
      final result = await FirebaseFunctions.instance
          .httpsCallable('getBook')
          .call({"id": currentIdDoc});
      String _response = result.data as String;
      print(_response);
      if (currentIdDoc == "") {
      } else {
        http.post(
          Uri.parse(
              'http://127.0.0.1:5002/crudbookflutter/us-central1/addBook1'),
          headers: <String, String>{
            "Access-Control-Allow-Origin": "*",
            'Content-Type': 'application/json',
            'Accept': '*/*',
            'X-Requested-With': 'XMLHttpRequest',
          },
          body: jsonEncode(<String, String>{
            "uid": currentIdDoc,
            'nameBook': book.getName(),
            'desBook': book.getDescription()
          }),
        );
      }
    });
    // print(currentIdDoc);
    // Similarly we can get email as well
    //final uemail = user.email;
    // print(uid);
    //print(uemail);
  }

  // delete book in firestore
  Future<http.Response> deleteBook(String bookId) async {
    // await _booksStream.doc(bookId).delete();

    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text('You have successfully deleted a product')));
    return http.delete(
      Uri.parse('http://127.0.0.1:5002/crudbookflutter/us-central1/deleteBook'),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'X-Requested-With': 'XMLHttpRequest',
      },
      body: jsonEncode(<String, String>{
        'bookId': bookId,
      }),
    );
  }

  // edit book in store

  Future<http.Response> EditBook(
      DocumentSnapshot documentSnapshot, bookModel newBook) async {
    return http.post(
      Uri.parse('http://127.0.0.1:5002/crudbookflutter/us-central1/editBook'),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'X-Requested-With': 'XMLHttpRequest',
      },
      body: jsonEncode(<String, dynamic>{
        'bookId': documentSnapshot.id,
        'nameBook': newBook.getName(),
        'desBook': newBook.getDescription()
      }).toString(),
    );
  }

  EditBook1(DocumentSnapshot documentSnapshot, bookModel newBook) {
    final callable =
        FirebaseFunctions.instance.httpsCallable("editBook1").call({
      'bookId': documentSnapshot.id,
      'nameBook': newBook.getName(),
      'desBook': newBook.getDescription()
    });
  }
  // {
  //   await _booksStream.doc(documentSnapshot!.id).update(
  //       {'nameBook': newBook.getName(), "desBook": newBook.getDescription()});
  // }
}
