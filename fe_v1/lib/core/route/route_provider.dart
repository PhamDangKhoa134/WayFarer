import 'package:fe_v1/core/route/route_name.dart';
import 'package:fe_v1/feature/presentation/pages/auth/splash_page.dart';
import 'package:fe_v1/feature/presentation/pages/auth/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey(debugLabel: 'root');
class RouteProvider {
  GoRouter goRouter() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            name: startRoute,
            pageBuilder: (context, state) => NoTransitionPage(
              child: SplashPage(
                key: state.pageKey,
              ),
            ),
          ),
        GoRoute(
            path: '/welcome',
            name: welComeRoute,
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const WelcomePage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              transitionDuration: const Duration(seconds: 1),
            ),
          ),
      ]);
  }}

