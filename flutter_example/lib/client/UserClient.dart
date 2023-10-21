import 'package:dio/dio.dart';

import '../model/User.dart';

class UserClient {
  static final Dio _dio = Dio();
  static const _baseUrl = 'https://reqres.in/api/users?page=1&per_page=2';

   Future<List<User>> getUsers() async {
    Response response;
    response = await _dio.get(_baseUrl);
    List<User> users = User.fromJson(response.data["data"]);
    users.forEach((element) {
      print(element.toString());
    });
    return users;
  }
}
