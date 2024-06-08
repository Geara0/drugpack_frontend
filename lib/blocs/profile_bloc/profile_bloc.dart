import 'dart:async';

import 'package:drugpack/blocs/profile_bloc/responses/get_account/get_account_response.dart';
import 'package:drugpack/dto/compatibility/compatibility_dto.dart';
import 'package:drugpack/dto/condition/condition_dto.dart';
import 'package:drugpack/dto/drug/drug_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/transformers.dart';
import '../../client/dio.dart';
import 'client/client.dart';

part 'profile_state.dart';

part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _client = ProfileClient(dio);

  List<DrugDto> drugs = [];
  List<ConditionDto> conditions = [];
  List<CompatibilityDto> compatibilities = [];

  @override
  onError(error, stackTrace) {
    add(_UnknownErrorEvent());
    super.onError(error, stackTrace);
  }

  ProfileBloc() : super(ProfileInitial()) {
    on<GetAccount>(
      _getAccount,
      transformer: (events, mapper) => events
          .throttleTime(const Duration(milliseconds: 500))
          .asyncExpand(mapper),
    );
    on<_UnknownErrorEvent>(_showUnknownError);
  }

  FutureOr<void> _getAccount(
      GetAccount event, Emitter<ProfileState> emit) async {
    final response = await _client.getAccountTotal();
    drugs = response.drugs;
    conditions = response.conditions;
    compatibilities = response.compatibilites;

    emit(ProfileSuccess());
  }

  FutureOr<void> _showUnknownError(
      _UnknownErrorEvent event, Emitter<ProfileState> emit) {
    emit(ProfileFailure(error: 'unknown error'));
  }
}
