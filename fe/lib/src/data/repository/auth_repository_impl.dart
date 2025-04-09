import '../datasource/remote/auth_remote_datasource.dart';
import '../model/login_response.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<LoginResponse> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}

