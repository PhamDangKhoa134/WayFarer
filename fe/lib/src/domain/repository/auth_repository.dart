import '../../data/model/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(String email, String password);
}
