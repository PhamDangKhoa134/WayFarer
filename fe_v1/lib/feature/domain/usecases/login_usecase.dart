import 'package:fe_v1/feature/data/dtos/login_dto.dart';
import 'package:fe_v1/feature/domain/entities/user_entity.dart';
import 'package:fe_v1/feature/domain/repositories/user_repository.dart';

class LoginUsecase {
  final UserRepository _repository;

  LoginUsecase(this._repository);

  Future<UserEntity?> call(LoginDto dto) {
    print("Call loginUseCase ${dto}");

    return _repository.login(dto);
  }
}
