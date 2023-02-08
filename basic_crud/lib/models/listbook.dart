import 'package:basic_crud/models/bookmodel.dart';
import 'package:flutter/material.dart';

class listBookModel extends ChangeNotifier {
  late List<bookModel> _listBook;

  getListBook() => _listBook;
  setListBook(List<bookModel> listBook) {
    _listBook = listBook;
  }

  addBook(bookModel book) {
    _listBook.add(book);
  }
}
