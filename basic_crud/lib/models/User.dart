class User {
  late String _id;
  late String _name;
  late int _age;
  late String _email;

  User(String name, int age, String email) {
    _name = name;
    _age = age;
    _email = email;
  }

  getId() => _id;
  getName() => _name;
  getAge() => _age;
  getEmail() => _email;

  setId(String id) {
    _id = id;
  }

  setName(String name) {
    _name = name;
  }

  setAge(int age) {
    _age = age;
  }

  setEmail(String email) {
    _email = email;
  }
}
