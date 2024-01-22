import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/locator.dart';
// import 'package:todo_app/core/utils/locator.dart';
import 'package:todo_app/core/utils/mediaquery.dart';
import 'package:todo_app/presentation/Bloc/auth/auth_bloc.dart';
import 'package:todo_app/presentation/Bloc/auth/auth_event.dart';
import 'package:todo_app/presentation/Bloc/todo/todo_bloc.dart';
import 'package:todo_app/presentation/Bloc/todo/todo_event.dart';
import 'package:todo_app/presentation/Bloc/todo/todo_state.dart';
import 'package:todo_app/presentation/pages/loginregis.dart';

import '../../core/utils/colors.dart';
import '../widgets/textfield.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final TextEditingController _title = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _title.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) async {
        if (state is TodoSuccesAddState ||
            state is TodoSuccesUpdateState ||
            state is TodoSuccesDeleteState) {
          Future.delayed(const Duration(seconds: 2), () {
            sl<TodoBloc>().add(TodoLoadDataEvent());
          });
        }
      },
      child: Scaffold(
          backgroundColor: Color(sl.get<Colorss>().colors1),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(sl.get<Colorss>().colors2),
            child: const Icon(
              Icons.add,
              color: Colors.white70,
            ),
            onPressed: () {
              _bottomsheetAdd();
            },
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _text(),
                SizedBox(
                  height: displayHeight(context) * 0.03,
                ),
                _listData()
              ],
            ),
          ))),
    );
  }

  Widget _text() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Todo",
          style: TextStyle(
              color: Colors.white70,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        IconButton(
            onPressed: () {
              sl.get<AuthenticationBloc>().add(LogOut());

              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LoginRegisPage(),
                  ),
                  (route) => false);
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white70,
            ))
      ],
    );
  }

  Widget _listData() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is TodoErorState) {
          return Center(
            child: Text(state.msg.toString()),
          );
        }
        if (state is TodoSuccesGetState) {
          return SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.todoentity!.length,
              itemBuilder: (context, index) {
                var data = state.todoentity![index];
                return Card(
                  child: ListTile(
                    leading: IconButton(
                        onPressed: () {
                          sl<TodoBloc>().add(
                              TodoUpdateDataEvent(data.id!, !data.isDone!));
                        },
                        icon: data.isDone! == false
                            ? const Icon(Icons.rectangle_outlined)
                            : const Icon(Icons.check_box_outlined)),
                    title: Text(data.title.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        sl<TodoBloc>().add(TodoDeleteDataEvent(data.id!));
                      },
                      icon: const Icon(Icons.delete_rounded),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Center(
          child: Text(state.msg.toString()),
        );
      },
    );
  }

  Widget _btnAdd() {
    return ElevatedButton(
      onPressed: () {
        sl.get<TodoBloc>().add(TodoAddDataEvent(_title.text, ""));
        Navigator.pop(context);
        _title.clear();
      },
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(10),
          backgroundColor: Color(sl.get<Colorss>().colors2),
          minimumSize:
              Size(displayWidth(context) * 0.8, displayWidth(context) * 0.12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 0),
      child: const Text(
        'Add Todo',
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  _bottomsheetAdd() {
    return showModalBottomSheet(
      backgroundColor: Color(sl.get<Colorss>().colors1),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            width: displayWidth(context),
            height: displayHeight(context) * 0.25,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  const Text(
                    "Add Todo",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  filds(context, _title, "title", 0.8, 0.06),
                  SizedBox(
                    height: displayHeight(context) * 0.02,
                  ),
                  _btnAdd()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
