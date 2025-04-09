import 'package:fe/src/domain/usecase/login_usecase.dart';
import 'package:fe/src/presentation/bloc/login/login_event.dart';
import 'package:fe/src/presentation/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(LoginInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final response = await loginUseCase.call(event.email, event.password);

      // Giả sử response chứa token và name
      emit(LoginSuccess(response.message));
    } catch (e) {
      emit(LoginFailure("Đăng nhập thất bại: ${e.toString()}"));
    }
  }
}
