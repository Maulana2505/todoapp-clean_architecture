// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String massage;
  const Failure(this.massage,);

  @override
  List<Object> get props => [massage];
}

class ServerFailure extends Failure {
  const ServerFailure(String massage) : super(massage);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String massage) : super(massage);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String massage) : super(massage);
}
