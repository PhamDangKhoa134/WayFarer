import 'package:fe_v1/feature/domain/usecases/login_usecase.dart';
import 'package:fe_v1/feature/presentation/bloc/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

extension BlocModule on GetIt {
  void registerBloc() {
    registerFactory(() => AuthBloc(
        get<LoginUsecase>()));
  }
}