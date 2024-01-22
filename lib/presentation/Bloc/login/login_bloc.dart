import 'package:bloc/bloc.dart';
import 'package:todo_app/domain/usecases/userUsecase/get_user.dart';
import 'package:todo_app/presentation/Bloc/login/login_event.dart';
import 'package:todo_app/presentation/Bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetUserUseCase getUserUseCase;
  LoginBloc(this.getUserUseCase) : super(LoginIntialState()) {
    on<LoginDataEvent>((event, emit) async {
      emit(LoginLoadingState());
      final getuser = await getUserUseCase(event.username, event.password);
      getuser.fold((failure) => emit(LoginErrorState(msg: failure.toString())),
          (r) => emit(LoginSuccesState()));
    });
  }
}
