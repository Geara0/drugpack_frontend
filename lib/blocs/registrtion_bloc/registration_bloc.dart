import 'dart:convert';

import 'package:drugpack/blocs/registrtion_bloc/registration_event.dart';
import 'package:drugpack/blocs/registrtion_bloc/registration_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';


class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial());

  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegistrationLoading();

      try {
        print(event.password);
        final passwordHash = sha256.convert(utf8.encode(event.password)).toString();
        print(passwordHash);
        print(event.email);
        final response =
            await http.post(Uri.parse("http://localhost:8080/signUp"),
                headers: {'Content-Type': 'application/json'},
                body: json.encode({
                  'email': event.email,
                  'password': passwordHash,
                }));
        print(response.body);
        print(response.statusCode);
        print(response.request);

        if (response.statusCode == 200) {
          yield RegistrationSuccess(message: 'Account created successfully!');
        } else {
          yield RegistrationFailure(
              error: 'Failed to create account. Please try again.');
        }
      } catch (e) {
        print(e);
        yield RegistrationFailure(
            error:
                'Failed to connect to the server. Please check your internet connection.');
      }
    }
  }
}
