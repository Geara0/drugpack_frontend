import 'dart:convert';

import 'package:drugpack/utils/account_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crypto/crypto.dart';

import '../../client/dio.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'client/client.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _client = AuthClient (dio);
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginButtonPressed) {
      yield AuthLoading();

      try {
        final passwordHash =
            sha256.convert(utf8.encode(event.password)).toString();
        final response = await _client.signIn(email: event.email, password: passwordHash);
        if (response.response.statusCode == 200) {
          AccountUtils.setAccountKey(response.data);
          AccountUtils.setAccountEmail(event.email);
          yield AuthSuccess(message: 'Authentication successful!');
        } else {
          yield AuthFailure(
              error: 'Failed to authenticate. Please check your credentials.');
        }
      } catch (e) {
        yield AuthFailure(
            error:
                'Failed to connect to the server. Please check your internet connection.');
      }
    }

    if (event is RegisterButtonPressed) {
      yield RegistrationLoading();

      try {
        debugPrint(event.password);
        final passwordHash = sha256.convert(utf8.encode(event.password)).toString();
        debugPrint('email: $event, password: $passwordHash');
        final response = await _client.signUp(email: event.email, password: passwordHash);

        debugPrint('email: $response.response.statusCode, password: $passwordHash');
        if (response.response.statusCode == 200) {
          AccountUtils.setAccountKey(response.data);
          AccountUtils.setAccountEmail(event.email);
          yield RegistrationSuccess(message: 'Account created successfully!');
        } else {
          yield RegistrationFailure(
              error: 'Failed to create account. Please try again.');
        }
      } catch (e) {
        yield RegistrationFailure(
            error:
            'Failed to connect to the server. Please check your internet connection.');
      }
    }
  }
}
