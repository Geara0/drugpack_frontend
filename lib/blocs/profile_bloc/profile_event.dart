abstract class ProfileEvent {}

class GetAccountDrugs extends ProfileEvent {
  final String email;

  GetAccountDrugs({required this.email});

  @override
  String toString() => 'GetAccountDrugs { email: $email}';
}
