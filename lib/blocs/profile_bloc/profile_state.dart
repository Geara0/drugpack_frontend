part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final String message;

  ProfileSuccess({required this.message});

  @override
  String toString() => 'ProfileStateSuccess { message: $message }';
}

class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure({required this.error});

  @override
  String toString() => 'ProfileStateFailure { error: $error }';
}