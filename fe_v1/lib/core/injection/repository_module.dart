import 'package:fe_v1/feature/data/datasources/user_remote_datasource.dart';
import 'package:fe_v1/feature/data/repositories/user_repository_impl.dart';
import 'package:fe_v1/feature/domain/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';

extension RepositoryModule on GetIt {
  void registerRepository() {
    registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(UserRemoteDatasource()));
  }
}