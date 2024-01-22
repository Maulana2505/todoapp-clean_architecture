import 'package:dio/dio.dart';
import 'package:todo_app/core/utils/sharedpreference.dart';
import 'package:todo_app/data/models/todo_model.dart';

import '../../../core/utils/constant.dart';
import '../../../core/utils/locator.dart';

class TodoApi {
  final Dio _dio = Dio();

  var apiUrl = Constant.baseUrl;

  final pref = SharedPreference();

  Future addTodo(String title) async {
    final ids = await sl<SharedPreference>().getid();
    var response = await _dio.post("$apiUrl/todo",
        data: {
          'userid': ids,
          'title': title,
        },
        options: Options(contentType: 'application/json'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      return response.data;
    }
  }

  Future<List<TodoModel>> getTodo() async {
    final ids = await sl<SharedPreference>().getid();
   final response = await _dio.get("$apiUrl/todo?userid=$ids",
        options: Options(contentType: 'application/json'));
    List<TodoModel> data =
        (response.data as List).map((e) => TodoModel.fromMap(e)).toList();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return data;
    }
    if (response.statusCode == 400) {
      return response.data;
    }
    return response.data;
    // print(data.toString());
    
  }

  Future deleteTodo(String id) async {
    final response = await _dio.delete("$apiUrl/todo/$id",
        options: Options(contentType: 'application/json'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      return response;
    }
  }

  Future updateTodo(String id, bool isDone) async {
    final response = await _dio.put("$apiUrl/todo/$id",
        data: {'isDone': isDone},
        options: Options(contentType: 'application/json'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else {
      return response;
    }
  }
}
