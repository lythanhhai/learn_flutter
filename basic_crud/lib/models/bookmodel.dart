import 'package:cloud_firestore/cloud_firestore.dart';

class bookModel {
  late String _id;
  late DocumentSnapshot _documentSnapshot;
  late String _name;
  late String _description;

  bookModel(String name, String description) {
    _name = name;
    _description = description;
  }

  bookModel1(String name, String description) {
    _name = name;
    _description = description;
  }

  getId() => _id;
  getName() => _name;
  getDescription() => _description;
  getDocumentSnapshot() => _documentSnapshot;

  setName(String name) {
    _name = name;
  }

  setDescription(String description) {
    _description = description;
  }

  setId(String Id) {
    this._id = Id;
  }

  setDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    _documentSnapshot = documentSnapshot;
  }
}
