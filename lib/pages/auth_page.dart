import 'package:drugpack/themes/themes.dart';
import 'package:drugpack/widgets/password_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_event.dart';
import '../blocs/auth_bloc/auth_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/email_text_form_field.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go('/main/profile');
        }
      },
      child: AuthPageContent(),
    );
  }
}

class AuthPageContent extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        decoration: ThemeClass.containerBackgroundDecoration(context),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                decoration: ThemeClass.containerDecoration(context),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    EmailTextField(
                      controller: emailController,
                    ),
                    PasswordTextField(
                      controller: passwordController,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            context.go('/auth/recovery');
                          },
                          child: Text(
                            'auth.Forgot password?'.tr(),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        authBloc.add(LoginButtonPressed(
                            email: emailController.text,
                            password: passwordController.text));
                      },
                      child: Text('auth.LOGIN'.tr()),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/auth/registration');
                      },
                      child: Text(
                        'auth.Register'.tr(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
