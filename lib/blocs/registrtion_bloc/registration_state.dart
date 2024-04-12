import 'package:flutter/material.dart';

abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {
  final String message;

  RegistrationSuccess({required this.message});

  @override
  String toString() => 'RegistrationSuccess { message: $message }';
}

class RegistrationFailure extends RegistrationState {
  final String error;

  RegistrationFailure({required this.error});

  @override
  String toString() => 'RegistrationFailure { error: $error }';
}
