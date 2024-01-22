import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/data/datasources/remote/todo_api.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/repository/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoApi _todoApi;

  TodoRepositoryImpl(this._todoApi);
  @override
  Future<Either<Failure, void>> addTodo(
      String title) async {
    try {
      var addtodo = await _todoApi.addTodo(title);
      return Right(addtodo);
    } on ServerSocket {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      print(e.toString());
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTodo(String id) async{
    try {
      var deletetodo = _todoApi.deleteTodo(id);
      return await Right(deletetodo);
    } on ServerSocket {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      print(e.toString());
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodo() async {
    try {
      var gettodo = await _todoApi.getTodo();
      if (gettodo.isEmpty) {
        return const Left(ServerFailure('Data Kosong'));
      }
      return Right(gettodo);
    } 
    // on ServerSocket {
    //   return const Left(ServerFailure(''));
    // } on SocketException {
    //   return const Left(ConnectionFailure('Failed to connect to the network'));
    // } 
    on DioException catch (e) {
      print(e.toString());
      return Left(ConnectionFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTodo(
     String id, bool isDone) async {
    try {
      var updatetodo = _todoApi.updateTodo(id,isDone);
      return Right(updatetodo);
    } on ServerSocket {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      print(e.toString());
      return Left(ConnectionFailure(e.toString()));
    }
  }
}
