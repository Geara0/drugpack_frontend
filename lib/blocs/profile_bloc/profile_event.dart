part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetAccount extends ProfileEvent {}

class GetAccountDrugs extends ProfileEvent {}

class AddAccountDrug extends ProfileEvent {
  final String drugId;

  AddAccountDrug(this.drugId);
}

class RemoveAccountDrug extends ProfileEvent {
  final String drugId;

  RemoveAccountDrug(this.drugId);
}

class _UnknownErrorEvent extends ProfileEvent {}
