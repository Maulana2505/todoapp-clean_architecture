// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/data/datasources/remote/user_api.dart';
import 'package:todo_app/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserApi userApi;
  UserRepositoryImpl({
    required this.userApi,
  });
  @override
  Future<Either<Failure, void>> addUser(
      String username, String password) async {
    try {
      final response = await userApi.CreateUser(username, password);
      print(response);
      return Right(response);
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
  Future<Either<Failure, void>> deleteUser(int id) {
    // TODO: implement deleteUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUser(
      String username, String password) async {
    try {
      Response response = await userApi.Getuser(username, password);
      return Right(response.toString());
    } on ServerSocket {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }on DioException catch (e) {
      print(e.toString());
      return Left(ConnectionFailure(e.toString()));
    }
  }
}
