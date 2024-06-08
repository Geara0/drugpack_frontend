part of 'edit_profile_bloc.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileSuccess extends EditProfileState {
  final String message;

  EditProfileSuccess({required this.message});

  @override
  String toString() => 'ProfileStateSuccess { message: $message }';
}

class EditProfileFailure extends EditProfileState {
  final String error;

  EditProfileFailure({required this.error});

  @override
  String toString() => 'ProfileStateFailure { error: $error }';
}
