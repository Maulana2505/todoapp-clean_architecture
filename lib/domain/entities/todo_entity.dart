// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoEntity {
  final String? id;
  final String userid;
  final String title;
  final String description;
  final DateTime? createAt;
   bool? isDone;
  TodoEntity({
    this.id, 
    required this.userid,
    required this.title,
    required this.description,
    this.createAt,
    this.isDone
  });
}
