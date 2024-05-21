abstract class ProfileEvent {}

class GetAccountDrugs extends ProfileEvent {
  final String email;

  GetAccountDrugs({required this.email});

  @override
  String toString() => 'GetAccountDrugs { email: $email}';
}

class AddAccountDrug extends ProfileEvent {
  final String drugId;

  AddAccountDrug(this.drugId);
}
class RemoveAccountDrug extends ProfileEvent {
  final String drugId;

  RemoveAccountDrug(this.drugId);
}
