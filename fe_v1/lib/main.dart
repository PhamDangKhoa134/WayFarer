import 'package:fe_v1/feature/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fe_v1/core/route/route_provider.dart';
import 'package:fe_v1/core/injection/injection.dart';
import 'package:fe_v1/core/utils/theme.dart';

void main() {
  init();
  // const MainApp()
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final route = getIt.get<RouteProvider>();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<AuthBloc>()),
          // BlocProvider(create: (_) => getIt<ProfileBloc>())
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: route.goRouter(),
          theme: myTheme,
        ));
  }
}
