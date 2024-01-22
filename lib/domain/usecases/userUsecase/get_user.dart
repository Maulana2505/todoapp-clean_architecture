import 'package:dartz/dartz.dart';
import 'package:todo_app/domain/repository/user_repository.dart';

import '../../../core/error/failure.dart';

class GetUserUseCase {
  final UserRepository repository;

  GetUserUseCase(this.repository);

  Future<Either<Failure, void>> call(String username,String password) async{
    return await repository.getUser(username,password);
  }
}
