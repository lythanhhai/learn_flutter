import 'package:basic_crud/models/listbook.dart';
import 'package:basic_crud/views/addbook.dart';
import 'package:flutter/material.dart';

import '../models/bookmodel.dart';

class bookcontroller extends ChangeNotifier {
  final listBookModel listBookController = listBookModel();
  setListBookController(List<bookModel> list) {
    listBookController.setListBook(list);
    notifyListeners();
  }

  addBook(bookModel book) {
    listBookController.addBook(book);
    notifyListeners();
  }
}
