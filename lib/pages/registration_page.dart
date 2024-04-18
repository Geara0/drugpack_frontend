import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_event.dart';
import '../themes.dart';
import '../widgets/email_text_form_field.dart';
import '../widgets/password_text_form_field.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(),
        child: RegistrationForm(),
      ),
    );
  }
}

class RegistrationForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registrationBloc = BlocProvider.of<AuthBloc>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Container(
                decoration: ThemeClass.containerDecoration,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    EmailTextField(
                      controller: emailController,
                    ),
                    PasswordTextField(
                      controller: passwordController,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        registrationBloc.add(
                          RegisterButtonPressed(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                      },
                      child: Text('auth.Register'.tr()),
                    ),
                    TextButton(
                      onPressed: () {
                        context.go('/auth/login');
                      },
                      child: Text('auth.Back'.tr()),
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
