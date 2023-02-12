import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/bookmodel.dart';

class bookcontroller extends ChangeNotifier {
  final CollectionReference _booksStream =
      FirebaseFirestore.instance.collection('books');
  late List<bookModel> books = [];

  bookcontroller() {
    FirebaseFirestore.instance
        .collection('books')
        .snapshots()
        .listen((snapshot) async {
      List<bookModel> list = [];
      for (var doc in snapshot.docs) {
        bookModel book =
            bookModel(doc.data()["nameBook"], doc.data()["desBook"]);
        book.setDocumentSnapshot(doc);
        list.add(book);
      }
      books = list;
      notifyListeners();
    });
  }

  // void bbb() {
  //   books = [bookModel("1", "2")];
  //   notifyListeners();
  // }

  getListBooks() {
    return books;
  }

  // add book to firestore
  Future<http.Response> AddBookToFireStore(bookModel book) {
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
    return http.post(
      Uri.parse('http://127.0.0.1:5001/crudbookflutter/us-central1/addBook1'),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'X-Requested-With': 'XMLHttpRequest',
      },
      body: jsonEncode(<String, String>{
        'nameBook': book.getName(),
        'desBook': book.getDescription()
      }),
    );
  }

  // delete book in firestore
  Future<http.Response> deleteBook(String bookId) async {
    // await _booksStream.doc(bookId).delete();

    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //     content: Text('You have successfully deleted a product')));
    return http.delete(
      Uri.parse('http://127.0.0.1:5001/crudbookflutter/us-central1/deleteBook'),
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
      Uri.parse('http://127.0.0.1:5001/crudbookflutter/us-central1/editBook'),
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
  // {
  //   await _booksStream.doc(documentSnapshot!.id).update(
  //       {'nameBook': newBook.getName(), "desBook": newBook.getDescription()});
  // }
}
