import '../../domain/entities/user.dart';

class UserDto {
  final String id;
  final String email;

  UserDto({required this.id, required this.email});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(id: json['id'], email: json['email']);
  }

  User toEntity() => User(id: id, email: email);
}
