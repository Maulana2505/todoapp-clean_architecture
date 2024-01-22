import 'package:bloc/bloc.dart';

import 'package:todo_app/core/utils/sharedpreference.dart';
import 'package:todo_app/presentation/Bloc/auth/auth_event.dart';
import 'package:todo_app/presentation/Bloc/auth/auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SharedPreference ids;
  AuthenticationBloc(this.ids) : super(AuthenticationUninitialized()) {
    on<AppStarted>((event, emit) async {
      emit(AuthenticationLoading());
      await ids.constantId("ids")
          ? emit(AuthenticationAuthenticated())
          : emit(AuthenticationUnauthenticated());
    });

    on<LogOut>((event, emit) async {
      emit(LogOutLoadingState());
      await ids.deleteId()
          ? emit(LogOutSuccesState())
          : emit(LogOutErrorState());
    });
  }
}
