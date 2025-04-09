import '../repository/auth_repository.dart';
import '../../data/model/login_response.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<LoginResponse> call(String email, String password) {
    return repository.login(email, password);
  }
}

