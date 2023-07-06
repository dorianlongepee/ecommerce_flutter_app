import 'dart:convert';
import 'package:flutter_shop/models/user.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<User> getUser() async {
    var uri = Uri.https('dummyjson.com', '/users/1');
    final res = await http.get(uri);

    Map data = jsonDecode(res.body);

    return User.userFromSnapshot(data);
  }
}
