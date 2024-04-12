import 'package:flutter/material.dart';

abstract class RegistrationEvent {}

class RegisterButtonPressed extends RegistrationEvent {
  final String email;
  final String password;

  RegisterButtonPressed({required this.email, required this.password});

  @override
  String toString() => 'RegisterButtonPressed { email: $email, password: $password }';
}
