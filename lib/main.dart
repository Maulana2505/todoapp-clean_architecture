import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/locator.dart';
import 'package:todo_app/presentation/Bloc/auth/auth_bloc.dart';
import 'package:todo_app/presentation/Bloc/auth/auth_event.dart';
import 'package:todo_app/presentation/Bloc/auth/auth_state.dart';
import 'package:todo_app/presentation/Bloc/login/login_bloc.dart';
import 'package:todo_app/presentation/Bloc/regis/regis_bloc.dart';
import 'package:todo_app/presentation/Bloc/todo/todo_bloc.dart';
import 'package:todo_app/presentation/Bloc/todo/todo_event.dart';
import 'package:todo_app/presentation/pages/dashbord.dart';
import 'package:todo_app/presentation/pages/loginregis.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  sl.get<AuthenticationBloc>()..add(AppStarted())),
          BlocProvider(create: (context) => sl<RegisBloc>()),
          BlocProvider(create: (context) => sl<LoginBloc>()),
          BlocProvider(
              create: (context) => sl.get<TodoBloc>()..add(TodoLoadDataEvent())),
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is AuthenticationAuthenticated) {
                return const DashboardPage();
              }
              if (state is AuthenticationUnauthenticated) {
                return const LoginRegisPage();
              }
              if (state is AuthenticationLoading) {
                // return Container();
                const Center(child: CircularProgressIndicator());
              }
              // return const Center(child: CircularProgressIndicator
              return Container();
            },
          ),
        ));
  }
}
