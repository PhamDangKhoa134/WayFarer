import 'package:fe_v1/feature/data/dtos/register_dto.dart';
import 'package:fe_v1/feature/domain/repositories/user_repository.dart';

class RegisterUsecase {
  final UserRepository _repository;

  RegisterUsecase(this._repository);
  Future<String?> call(RegisterDto dto) {
    return _repository.register(dto);
  }
}
