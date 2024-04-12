import 'package:drugpack/pages/recovery_page.dart';
import 'package:drugpack/pages/registration_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_event.dart';
import '../blocs/auth_bloc/auth_state.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(),
      child: AuthPageContent(),
    );
  }
}

class AuthPageContent extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('login.title').tr(),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthSuccess) {
            return Center(
              child: Text('Authenticated!'),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                authBloc.add(LoginButtonPressed(email: emailController.text,
                    password: passwordController.text));
              },
              child: Text('Login'),
            ),
              ElevatedButton(
                onPressed: () {
                  context.go('/auth/registration');
                },
                child: Text('Регистрация'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/auth/recovery');
                },
                child: Text('Восстановление аккаунта'),
              ),
              ],
            ),
          );
        },
      ),
    );
  }
}
