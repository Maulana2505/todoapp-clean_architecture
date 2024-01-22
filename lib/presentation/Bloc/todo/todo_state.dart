// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:todo_app/domain/entities/todo_entity.dart';

abstract class TodoState extends Equatable {
  final List<TodoEntity>? todoentity;
  final String? msg;
  TodoState({
    this.todoentity,
    this.msg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [todoentity,msg];
}

class TodoInitialState extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoSuccesAddState extends TodoState {}

class TodoSuccesGetState extends TodoState {
  TodoSuccesGetState(List<TodoEntity> todoentity) : super(todoentity: todoentity);
}

class TodoSuccesDeleteState extends TodoState {}

class TodoSuccesUpdateState extends TodoState {}

class TodoErorState extends TodoState {
  TodoErorState(String msg) : super(msg: msg);
}

