import 'dart:convert';

import 'package:bloc_pattern/callme/Usermodels.dart';
import 'package:http/http.dart';

import 'usermodel.dart';

class UserRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<Usermodels> getmydata() async {
    Response response = await get(Uri.parse("https://dummyjson.com/users"));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return Usermodels.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
