import 'package:fe_v1/core/route/route_name.dart';
import 'package:fe_v1/feature/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
final List<GoRoute> authRoutes = [
  GoRoute(
      path: '/login',
      name: logInRoute,
      pageBuilder: (context, state) => NoTransitionPage(
              child: LoginPage(
            key: state.pageKey,
          ))),
];