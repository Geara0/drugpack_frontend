abstract class ProfileEvent {}

class GetAccountDrugs extends ProfileEvent {
  GetAccountDrugs();
}

class AddAccountDrug extends ProfileEvent {
  final String drugId;

  AddAccountDrug(this.drugId);
}

class RemoveAccountDrug extends ProfileEvent {
  final String drugId;

  RemoveAccountDrug(this.drugId);
}
