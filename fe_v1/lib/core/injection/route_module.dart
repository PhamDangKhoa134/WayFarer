import 'package:fe_v1/core/route/route_provider.dart';
import 'package:get_it/get_it.dart';

extension RouteModule on GetIt {
  void registerRoute() {
    registerFactory(() => RouteProvider());
  }
}