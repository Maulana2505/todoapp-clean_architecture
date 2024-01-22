import 'package:get_it/get_it.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/sharedpreference.dart';
import 'package:todo_app/data/datasources/remote/todo_api.dart';
import 'package:todo_app/data/datasources/remote/user_api.dart';
import 'package:todo_app/data/repository/todo_repository_impl.dart';
import 'package:todo_app/data/repository/user_repository_impl.dart';
import 'package:todo_app/domain/repository/todo_repository.dart';
import 'package:todo_app/domain/usecases/todoUsecase/add_todo.dart';
import 'package:todo_app/domain/usecases/todoUsecase/delete_todo.dart';
import 'package:todo_app/domain/usecases/todoUsecase/get_todo.dart';
import 'package:todo_app/domain/usecases/todoUsecase/update_todo.dart';
import 'package:todo_app/domain/usecases/userUsecase/add_user.dart';
import 'package:todo_app/domain/usecases/userUsecase/get_user.dart';
import 'package:todo_app/presentation/Bloc/auth/auth_bloc.dart';
import 'package:todo_app/presentation/Bloc/login/login_bloc.dart';
import 'package:todo_app/presentation/Bloc/regis/regis_bloc.dart';
import 'package:todo_app/presentation/Bloc/todo/todo_bloc.dart';

import '../../domain/repository/user_repository.dart';

GetIt sl = GetIt.instance;

void setUp(){
  sl.registerSingleton<SharedPreference>(SharedPreference());
  sl.registerSingleton<Colorss>(Colorss());
  sl.registerFactory(() => UserApi());
  sl.registerFactory(() => TodoApi());
  // Repository
  sl.registerSingleton(UserRepositoryImpl(userApi: sl()));
  sl.registerSingleton(TodoRepositoryImpl(sl()));
  sl.registerFactory<UserRepository>(()=>UserRepositoryImpl(userApi: sl()));
  sl.registerFactory<TodoRepository>(() => TodoRepositoryImpl(sl()));

  // UseCase
    //User Use Case
      sl.registerSingleton<AddUserUseCase>(AddUserUseCase(sl()));
      sl.registerSingleton<GetUserUseCase>(GetUserUseCase(sl()));
    //Todo Use Case
      sl.registerSingleton<AddTodoUsecase>(AddTodoUsecase(sl()));  
      sl.registerSingleton<GetTodoUseCase>(GetTodoUseCase(sl()));  
      sl.registerSingleton<DeleteTodoUseCase>(DeleteTodoUseCase(sl()));  
      sl.registerSingleton<UpdateTodoUseCase>(UpdateTodoUseCase(sl()));  


  // Bloc
  sl.registerSingleton<RegisBloc>(RegisBloc(sl()));
  sl.registerSingleton<LoginBloc>(LoginBloc(sl()));
  sl.registerSingleton<AuthenticationBloc>(AuthenticationBloc(sl()));
  sl.registerSingleton<TodoBloc>(TodoBloc(sl(), sl(), sl(), sl()));


}
