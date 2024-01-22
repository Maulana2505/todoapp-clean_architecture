
import 'package:equatable/equatable.dart';

abstract class RegisEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisDataEvent extends RegisEvent {
  final String username;
  final String password;
  RegisDataEvent({
    required this.username,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [username,password];
}
