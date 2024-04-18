abstract class AuthEvent {}

class LoginButtonPressed extends AuthEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});

  @override
  String toString() => 'LoginButtonPressed { email: $email, password: $password }';
}

class RegisterButtonPressed extends AuthEvent {
  final String email;
  final String password;

  RegisterButtonPressed({required this.email, required this.password});

  @override
  String toString() => 'RegisterButtonPressed { email: $email, password: $password }';
}
