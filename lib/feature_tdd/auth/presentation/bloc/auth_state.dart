import 'package:bloc_api/feature_tdd/auth/domain/entities/user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class OtpSentState extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
