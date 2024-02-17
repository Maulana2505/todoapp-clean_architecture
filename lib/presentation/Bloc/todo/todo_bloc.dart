// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bloc/bloc.dart';

import 'package:todo_app/domain/usecases/todoUsecase/add_todo.dart';
import 'package:todo_app/domain/usecases/todoUsecase/delete_todo.dart';
import 'package:todo_app/domain/usecases/todoUsecase/get_todo.dart';
import 'package:todo_app/domain/usecases/todoUsecase/update_todo.dart';
import 'package:todo_app/presentation/Bloc/todo/todo_event.dart';
import 'package:todo_app/presentation/Bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUsecase addTodoUsecase;
  final GetTodoUseCase getTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final UpdateTodoUseCase updateTodoUseCase;
  TodoBloc(
    this.addTodoUsecase,
    this.getTodoUseCase,
    this.deleteTodoUseCase,
    this.updateTodoUseCase,
  ) : super(TodoInitialState()) {
    on<TodoLoadDataEvent>(_onLoadData);
    on<TodoAddDataEvent>(_onAddData);
    on<TodoDeleteDataEvent>(_onDeleteData);
    on<TodoUpdateDataEvent>(_onUpdateData);
  }
  void _onLoadData(TodoLoadDataEvent event, Emitter<TodoState> emitter) async {
    emitter(TodoLoadingState());
    final dataload = await getTodoUseCase();
    dataload!.fold((fail) => emitter(TodoErorState(fail.toString())),
        (r) => emitter(TodoSuccesGetState(r)));
  }

  void _onAddData(TodoAddDataEvent event, Emitter<TodoState> emitter) async {
    // emitter(TodoLoadingState());
    final dataadd = await addTodoUsecase(event.title!);
    dataadd.fold((l) => emitter(TodoErorState(l.toString())),
        (r) => emitter(TodoSuccesAddState()));
  }

  void _onDeleteData(
      TodoDeleteDataEvent event, Emitter<TodoState> emitter) async {
    emitter(TodoLoadingState());
    final dataadd = await deleteTodoUseCase(event.id!);
    dataadd.fold((l) => emitter(TodoErorState(l.toString())),
        (r) => emitter(TodoSuccesDeleteState()));
  }

  void _onUpdateData(
      TodoUpdateDataEvent event, Emitter<TodoState> emitter) async {
    emitter(TodoLoadingState());
    final dataadd =
        await updateTodoUseCase(event.id!, event.isDone!);
    dataadd.fold((l) => emitter(TodoErorState(l.toString())),
        (r) => emitter(TodoSuccesUpdateState()));
  }
}
