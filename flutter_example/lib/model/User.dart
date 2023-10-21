class User {
  int _id;
  String _email;

  User(this._id, this._email);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  static List<User> fromJson(List<dynamic> json) {
    List<User> users = [];
    json.forEach((element) {
      User user = User(element["id"], element["email"]);
      users.add(user);
    });
    return users;
  }

  @override
  String toString() {
    return 'User{_id: $_id, _email: $_email}';
  }
}
