// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/repository/todo_repository.dart';

import '../../../core/error/failure.dart';

class GetTodoUseCase {
  final TodoRepository todoRepository;
  GetTodoUseCase(
    this.todoRepository,
  );

  Future<Either<Failure, List<TodoEntity>>?> call() async {
    return todoRepository.getTodo();
  }
}
