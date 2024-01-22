import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/presentation/Bloc/login/login_bloc.dart';
import 'package:todo_app/presentation/Bloc/login/login_event.dart';
import 'package:todo_app/presentation/Bloc/login/login_state.dart';
import 'package:todo_app/presentation/pages/dashbord.dart';

import 'package:todo_app/presentation/widgets/textfield.dart';

import '../../core/utils/locator.dart';
import '../../core/utils/mediaquery.dart';
import '../Bloc/todo/todo_bloc.dart';
import '../Bloc/todo/todo_event.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(sl.get<Colorss>().colors1),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccesState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Berhasil Login')));
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const DashboardPage()),
                (Route<dynamic> route) => false);
          }
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.msg.toString())));
          }
        },
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                filds(context, _username, "Username", 0.8, 0.06),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                filds(context, _password, "Password", 0.8, 0.06),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                _btnLogin(),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget _btnLogin() {
    return ElevatedButton(
      onPressed: () {
        sl.get<LoginBloc>().add(
            LoginDataEvent(username: _username.text, password: _password.text));

        sl.get<TodoBloc>().add(TodoLoadDataEvent());
      },
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: Color(sl.get<Colorss>().colors2),
          minimumSize:
              Size(displayWidth(context) * 0.8, displayWidth(context) * 0.12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 0),
      child: const Text(
        'Login',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}
