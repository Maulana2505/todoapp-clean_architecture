// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:todo_app/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel(
      {final String? id,
      required String userid,
      required String title,
      required String description,
      final DateTime? createAt,
      bool? isDone})
      : super(
            id: id,
            userid: userid,
            title: title,
            description: description,
            createAt: createAt,
            isDone: isDone);

  Map<String, dynamic> toMap() => {
        "userid": userid,
        "title": title,
        "description": description,
        "createAt": createAt,
        "id": id,
        "isDone": isDone
      };

  factory TodoModel.fromMap(Map<String, dynamic> json) => TodoModel(
      userid: json["userid"],
      title: json["title"],
      description: json["description"],
      createAt: DateTime.parse(json["createAt"]),
      id: json["id"],
      isDone: json["isDone"]);

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
