import 'package:fe_v1/feature/domain/repositories/user_repository.dart';
import 'package:fe_v1/feature/domain/usecases/login_usecase.dart';
import 'package:get_it/get_it.dart';

extension UsecaseModule on GetIt {
  void registerUsecase() {
    registerLazySingleton(() => LoginUsecase(get<UserRepository>()));
  }
}