
class UserEntity {
  final int? id;
  final String username;
  final String? avatar;
  final String password;
  UserEntity({
    this.id,
    required this.username,
    this.avatar,
    required this.password,
  });
  
}
