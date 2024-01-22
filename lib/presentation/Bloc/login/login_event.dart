// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginDataEvent extends LoginEvent {
  final String username;
  final String password;
  LoginDataEvent({
    required this.username,
    required this.password,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [username,password];
}
