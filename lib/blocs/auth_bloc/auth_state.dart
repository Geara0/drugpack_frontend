abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess({required this.message});

  @override
  String toString() => 'AuthSuccess { message: $message }';
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});

  @override
  String toString() => 'AuthFailure { error: $error }';
}

class RegistrationInitial extends AuthState {}

class RegistrationLoading extends AuthState {}

class RegistrationSuccess extends AuthState {
  final String message;

  RegistrationSuccess({required this.message});

  @override
  String toString() => 'RegistrationSuccess { message: $message }';
}

class RegistrationFailure extends AuthState {
  final String error;

  RegistrationFailure({required this.error});

  @override
  String toString() => 'RegistrationFailure { error: $error }';
}