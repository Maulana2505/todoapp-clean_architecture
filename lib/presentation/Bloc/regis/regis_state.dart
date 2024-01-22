import 'package:equatable/equatable.dart';

abstract class RegisState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegisInitialState extends RegisState {}

class RegisLoadingState extends RegisState {}

class RegisSuccesState extends RegisState {}

class RegisErrorState extends RegisState {
  final String msg;
  RegisErrorState(this.msg);
  @override
  // TODO: implement props
  List<Object?> get props => [msg];
}
