import 'package:fe_v1/feature/data/datasources/user_remote_datasource.dart';
import 'package:fe_v1/feature/data/dtos/login_dto.dart';
import 'package:fe_v1/feature/domain/entities/user_entity.dart';
import 'package:fe_v1/feature/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource remoteDataSource;
  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity?> login(LoginDto dto) async => await remoteDataSource
      .login(dto)
      .then((data) => data)
      .catchError((error) => throw error);

  }