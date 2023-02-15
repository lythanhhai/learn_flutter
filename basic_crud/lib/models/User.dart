class User {
  late String _id;
  late String _name;
  late int _age;

  User(String name, int age) {
    _name = name;
    _age = age;
  }

  getId() => _id;
  getName() => _name;
  getAge() => _age;

  setId(String id) {
    _id = id;
  }

  setName(String name) {
    _name = name;
  }

  setAge(int age) {
    _age = age;
  }
}
