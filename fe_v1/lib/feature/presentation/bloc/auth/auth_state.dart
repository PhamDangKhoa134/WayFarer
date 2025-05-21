abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String sucess;

  AuthSuccess(this.sucess);
}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
