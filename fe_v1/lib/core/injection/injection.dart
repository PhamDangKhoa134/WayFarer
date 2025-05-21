import 'package:fe_v1/core/injection/bloc_module.dart';
import 'package:fe_v1/core/injection/repository_module.dart';
import 'package:fe_v1/core/injection/route_module.dart';
import 'package:fe_v1/core/injection/usecase_module.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerRoute();

  getIt.registerRepository();

  getIt.registerUsecase();

  getIt.registerBloc();
}