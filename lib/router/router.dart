import 'dart:async';

import 'package:drugpack/blocs/profile_bloc/profile_bloc.dart';
import 'package:drugpack/blocs/search_bloc/search_bloc.dart';
import 'package:drugpack/dto/drug/drug_dto.dart';
import 'package:drugpack/pages/auth_page.dart';
import 'package:drugpack/pages/home_page.dart';
import 'package:drugpack/pages/recovery_page.dart';
import 'package:drugpack/pages/registration_page.dart';
import 'package:drugpack/utils/account_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../pages/drug_page.dart';
import '../pages/profile_page.dart';

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
        redirect: _mainRedirect,
        routes: [
          GoRoute(
            path: 'home',
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => SearchBloc<DrugDto>(
                    'search/drugs',
                    deserialize: DrugDto.fromJson,
                  ),
                ),
              ],
              child: HomePage(key: state.pageKey),
            ),
            // routes: [
            //   GoRoute(
            //     path: 'Drug/:id',
            //     builder: (context, state) {
            //       return DrugPage(drugDto: ,);
            //     },
            //   ),
            // ],
          ),
          GoRoute(
            path: 'profile',
            builder: (context, state) {
              return BlocProvider<ProfileBloc>(
                create: (context) => ProfileBloc(),
                child: ProfilePage(
                  key: state.pageKey,
                ),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: 'auth',
        redirect: _authRedirect,
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) {
              return BlocProvider<AuthBloc>(
                create: (context) => AuthBloc(),
                child: AuthPage(
                  key: state.pageKey,
                ),
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
  final token = await AccountUtils.tryAccountKey;
  if (token != null) {
    return '/main/home';
  }
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

FutureOr<String?> _mainRedirect(BuildContext context, GoRouterState state) {
  if (state.fullPath == '/main') return '/main/home';
  return null;
}
