import 'dart:convert';

import 'package:drugpack/utils/account_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import '../../client/dio.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'client/client.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _client = AuthClient (dio);
  AuthBloc() : super(AuthInitial());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is LoginButtonPressed) {
      yield AuthLoading();

      try {
        final passwordHash =
            sha256.convert(utf8.encode(event.password)).toString();
        final response = await _client.signIn(email: event.email, password: passwordHash);

        if (response is String) {
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
        final passwordHash = sha256.convert(utf8.encode(event.password)).toString();
        final response = await _client.signIn(email: event.email, password: passwordHash);

        if (response is String) {
          AccountUtils.setAccountKey(response);
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
