import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failure.dart';

import '../../repository/todo_repository.dart';

class UpdateTodoUseCase {
  final TodoRepository todoRepository;

  UpdateTodoUseCase(this.todoRepository);

  Future<Either<Failure, void>> call(String id,bool isDone) async {
    return todoRepository.updateTodo(id,isDone);
  }
}