// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  final String? id;
  final String? userid, title;
  final bool? isDone;
  TodoEvent({this.id, this.userid, this.title, this.isDone});

  @override
  // TODO: implement props
  List<Object?> get props => [id!, userid!, title!];
}

class TodoLoadDataEvent extends TodoEvent {}

class TodoAddDataEvent extends TodoEvent {
  TodoAddDataEvent(String title, String description) : super(title: title);
}

class TodoDeleteDataEvent extends TodoEvent {
  TodoDeleteDataEvent(String id) : super(id: id);
}

class TodoUpdateDataEvent extends TodoEvent {
  TodoUpdateDataEvent(String id, bool isDone)
      : super(
          id: id,
          isDone: isDone,
        );
}
