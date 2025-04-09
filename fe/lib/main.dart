import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/presentation/bloc/login/login_bloc.dart';
import 'src/presentation/page/login_page.dart';
import 'src/presentation/page/home_page.dart'; // <- import trang home của bạn
import 'injection.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<LoginBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Login',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/home': (context) => const HomePage(name: '',), // <- thêm dòng này để fix lỗi
        },
      ),
    );
  }
}
