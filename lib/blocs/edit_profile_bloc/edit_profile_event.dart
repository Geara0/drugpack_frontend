part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent {}

class GetAccountDrugs extends EditProfileEvent {
  GetAccountDrugs();
}

class AddAccountDrug extends EditProfileEvent {
  final String drugId;

  AddAccountDrug(this.drugId);
}

class RemoveAccountDrug extends EditProfileEvent {
  final String drugId;

  RemoveAccountDrug(this.drugId);
}
