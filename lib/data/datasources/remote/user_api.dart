// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:dio/dio.dart';
import 'package:todo_app/core/utils/constant.dart';
import 'package:todo_app/core/utils/locator.dart';
import 'package:todo_app/core/utils/sharedpreference.dart';

class UserApi {
  final Dio _dio = Dio();

  var apiUrl = Constant.baseUrl;

  Future CreateUser(String username, String password) async {
    var response = await _dio.post('$apiUrl/user?',
        data: {'username': username, 'password': password},
        options: Options(contentType: 'application/json'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      return response;
    }
  }

  Future Getuser(String username, String password) async {
    var response = await _dio.get(
      '$apiUrl/user?username=$username&password=$password',
      options: Options(contentType: 'application/json'),
    );

    if (response.statusCode == 200) {
      print(response.data[0]['id'].toString());
      sl<SharedPreference>().setid(response.data[0]['id'].toString());
      return response;
    } else {
      print(response.data);
      return response;
    }
  }
}
