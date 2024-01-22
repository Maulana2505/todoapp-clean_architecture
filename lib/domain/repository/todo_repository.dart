import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoEntity>>> getTodo();
  Future<Either<Failure, void>> addTodo(
       String title);
  Future<Either<Failure, void>> updateTodo(
     String id, bool isDone);
  Future<Either<Failure, void>> deleteTodo(String id);
}
