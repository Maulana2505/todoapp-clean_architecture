

import 'package:dartz/dartz.dart';
import 'package:todo_app/domain/repository/todo_repository.dart';

import '../../../core/error/failure.dart';

class AddTodoUsecase {
  final TodoRepository todoRepository;
  AddTodoUsecase(this.todoRepository);

  Future<Either<Failure, void>> call(String title) async{
    return await todoRepository.addTodo(title);
  }
}