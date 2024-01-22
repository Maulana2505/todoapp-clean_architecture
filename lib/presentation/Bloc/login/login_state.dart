// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginIntialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccesState extends LoginState {}

class LoginErrorState extends LoginState {
  final String msg;
  LoginErrorState({
    required this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
