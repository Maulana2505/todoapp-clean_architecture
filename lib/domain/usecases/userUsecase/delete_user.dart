import 'package:dartz/dartz.dart';
import 'package:todo_app/domain/repository/user_repository.dart';

import '../../../core/error/failure.dart';

class DeletUserUseCase {
  final UserRepository repository;

  DeletUserUseCase(this.repository);

  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteUser(id);
  }
}
