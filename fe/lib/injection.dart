import 'package:get_it/get_it.dart';
import 'src/data/datasource/remote/auth_remote_datasource.dart';
import 'src/data/repository/auth_repository_impl.dart';
import 'src/domain/repository/auth_repository.dart';
import 'src/domain/usecase/login_usecase.dart';
import 'src/presentation/bloc/login/login_bloc.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));
  getIt.registerLazySingleton<LoginUseCase>(() => LoginUseCase(getIt<AuthRepository>()));
  getIt.registerFactory(() => LoginBloc(getIt<LoginUseCase>()));
}
