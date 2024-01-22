import 'package:dartz/dartz.dart';
import 'package:todo_app/domain/repository/todo_repository.dart';

import '../../../core/error/failure.dart';

class DeleteTodoUseCase {
  final TodoRepository todoRepository;

  DeleteTodoUseCase(this.todoRepository);

  Future<Either<Failure, void>> call(String id) async {
    return todoRepository.deleteTodo(id);
  }
}
