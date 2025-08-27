import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/user_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User> login(String email, String password) async {
    // Fake API call (replace with Dio/HttpClient)
    await Future.delayed(Duration(seconds: 1));
    final json = {"id": "123", "email": email};
    return UserDto.fromJson(json).toEntity();
  }

  @override
  Future<void> logout() async {
    await Future.delayed(Duration(milliseconds: 500));
  }
}
