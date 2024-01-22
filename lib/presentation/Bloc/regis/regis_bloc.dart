import 'package:bloc/bloc.dart';
import 'package:todo_app/domain/usecases/userUsecase/add_user.dart';
import 'package:todo_app/presentation/Bloc/regis/regis_event.dart';
import 'package:todo_app/presentation/Bloc/regis/regis_state.dart';

class RegisBloc extends Bloc<RegisEvent, RegisState> {
  final AddUserUseCase addUserUseCase;

  RegisBloc(this.addUserUseCase) : super(RegisInitialState()) {
    on<RegisDataEvent>((event, emit) async {
      emit(RegisLoadingState());
      final adduser = await addUserUseCase(event.username, event.password);
      adduser.fold((failure) => emit(RegisErrorState(failure.toString())),
          (adduser) => emit(RegisSuccesState()));
    });
  }
}
