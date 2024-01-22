import 'package:dartz/dartz.dart';
import 'package:todo_app/core/error/failure.dart';


abstract class UserRepository {
  Future<Either<Failure, void>> getUser(String username,String password);
  Future<Either<Failure, void>> addUser(String username,String password);
  Future<Either<Failure, void>> deleteUser(int id);
}
