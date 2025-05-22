import 'package:fe_v1/core/exceptions/user_exception.dart';
import 'package:fe_v1/feature/domain/usecases/login_usecase.dart';
import 'package:fe_v1/feature/domain/usecases/register_usecase.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase loginUsecase;
  final RegisterUsecase registerUsecase;
  AuthBloc(this.loginUsecase, this.registerUsecase)
    : super(AuthInitial()) {
      on<LoginRequest>(_onLoginRequest);
      on<RegisterRequest>(_onRegisterRequest);
  }

    Future<void> _onLoginRequest(
      LoginRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await loginUsecase(event.dto);
      emit(AuthSuccess("Đăng nhập thành công"));
    } on UserException catch (e) {
      emit(AuthError(e.message));
    }
  }

    Future<void> _onRegisterRequest(
      RegisterRequest event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await registerUsecase(event.dto);
      emit(AuthSuccess(result!));
    } on UserException catch (e) {
      emit(AuthError(e.message));
    }
  }
}