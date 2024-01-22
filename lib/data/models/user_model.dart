// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:todo_app/domain/entities/user.dart';

class UserModel extends UserEntity {
  final int? id;
  final String username;
  final String? avatar;
  final String password;
  UserModel({
    this.id,
    required this.username,
    this.avatar,
    required this.password,
  }) : super(id: id, username: username, avatar: avatar, password: password);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'avatar': avatar,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] as String,
      avatar: map['avatar'] != null ? map['avatar'] as String : null,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
