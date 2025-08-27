import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';

sealed class AuthEvent {}
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}

sealed class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;

  AuthBloc(this.loginUser) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await loginUser(event.email, event.password);
        emit(Authenticated(user));
      } catch (e) {
        emit(AuthError("Login failed"));
      }
    });
  }
}
