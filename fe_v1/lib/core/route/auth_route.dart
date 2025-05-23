import 'package:fe_v1/core/route/route_name.dart';
import 'package:fe_v1/feature/presentation/pages/auth/login_page.dart';
import 'package:fe_v1/feature/presentation/pages/auth/signup_page.dart';
import 'package:fe_v1/feature/presentation/pages/home/home_page.dart';
import 'package:fe_v1/feature/presentation/pages/nav/bottom_bar_page.dart';
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
  GoRoute(
    path: '/signup',
    name: signUpRoute,
    pageBuilder: (context, state) => NoTransitionPage(
      child: SignupPage(
        key: state.pageKey,
      ),
    ),
  ),
  GoRoute(
    path: '/home',
    name: homeRoute,
    pageBuilder: (context, state) => NoTransitionPage(
      child: BottomBarPage(
        key: state.pageKey,
      ),
    ),
  ),
];