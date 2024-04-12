import 'package:flutter/material.dart';

abstract class AuthEvent {}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  String toString() => 'RegisterButtonPressed { email: $email, password: $password }';
}
