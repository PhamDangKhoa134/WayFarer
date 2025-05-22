import 'package:fe_v1/feature/data/dtos/login_dto.dart';
import 'package:fe_v1/feature/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> login(LoginDto dto);
}