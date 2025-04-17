
import 'package:fe_v2/presentation/login/login.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const MyHomePage(title: 'Trang nay',),
  };
}