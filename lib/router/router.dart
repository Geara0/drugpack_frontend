import 'dart:async';

import 'package:drugpack/pages/auth_page.dart';
import 'package:drugpack/pages/recovery_page.dart';
import 'package:drugpack/pages/registration_page.dart';
import 'package:drugpack/utils/account_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final rootKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  routes: _routes,
  navigatorKey: rootKey,
  debugLogDiagnostics: true,
);

final List<RouteBase> _routes = [
  GoRoute(
    path: '/',
    redirect: _goDefault,
    routes: [
      GoRoute(
        path: 'main',
        builder: (context, state) {
          return Placeholder();
        },
      ),
      GoRoute(
        path: 'auth',
        redirect: _authRedirect,
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) {
              return AuthPage(
                key: state.pageKey,
              );
            },
          ),
          GoRoute(
            path: 'recovery',
            builder: (context, state) {
              return RecoveryPage(
                key: state.pageKey,
              );
            },
          ),
          GoRoute(
            path: 'registration',
            builder: (context, state) {
              return RegistrationPage(
                key: state.pageKey,
              );
            },
          ),
        ],
      ),
    ],
  ),
];

FutureOr<String?> _goDefault(BuildContext context, GoRouterState state) async {
  final token = await AccountUtils.accountKey;
  debugPrint(token);
  if (token == null &&
      !(state.fullPath ?? state.path ?? '').startsWith('/auth')) {
    return '/auth';
  }
  if (state.fullPath == '/') return '/main';
  return null;
}

FutureOr<String?> _authRedirect(BuildContext context, GoRouterState state) {
  if (state.fullPath == '/auth') return '/auth/login';
  return null;
}
