import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/mediaquery.dart';
import 'package:todo_app/presentation/Bloc/regis/regis_bloc.dart';
import 'package:todo_app/presentation/Bloc/regis/regis_event.dart';
import 'package:todo_app/presentation/Bloc/regis/regis_state.dart';

import 'package:todo_app/presentation/widgets/textfield.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/locator.dart';

class RegisPage extends StatefulWidget {
  const RegisPage({super.key});

  @override
  State<RegisPage> createState() => _RegisPageState();
}

class _RegisPageState extends State<RegisPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(sl.get<Colorss>().colors1),
        body: BlocListener<RegisBloc, RegisState>(
          listener: (context, state) {
            if (state is RegisSuccesState) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Berhasil Regis')));
              print("sdad");
            } else if (state is RegisErrorState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg.toString())));
              print(state.msg);
            }
          },
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                filds(context, _username, "Username", 0.8, 0.06),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                filds(context, _password, "Password", 0.8, 0.06),
                SizedBox(
                  height: displayHeight(context) * 0.02,
                ),
                _btnRegis()
              ],
            ),
          )),
        ));
  }

  Widget _btnRegis() {
    return ElevatedButton(
      onPressed: () {
        sl.get<RegisBloc>().add(
            RegisDataEvent(username: _username.text, password: _password.text));
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: Color(sl.get<Colorss>().colors2),
          minimumSize:
              Size(displayWidth(context) * 0.8, displayWidth(context) * 0.12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 0),
      child: Text(
        'Regis',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}
