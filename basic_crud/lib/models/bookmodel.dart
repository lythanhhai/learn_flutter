class bookModel {
  late int _id;
  late String _name;
  late String _description;

  // bookModel(String name, String description) {
  //   this._name = name;
  //   this._description = description;
  // }

  getId() => _id;
  getName() => _name;
  getDescription() => _description;

  setName(String name) {
    this._name = name;
  }

  setDescription(String description) {
    this._description = description;
  }

  setId(int Id) {
    this._id = Id;
  }
}
