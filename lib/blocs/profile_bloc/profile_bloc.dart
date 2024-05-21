import 'package:drugpack/dto/drug/drug_dto.dart';
import 'package:drugpack/utils/account_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../client/dio.dart';
import 'profile_event.dart';
import 'client/client.dart';

part 'profile_state.dart';

    class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _client = ProfileClient (dio);

  List<DrugDto> drugs =[];
  ProfileBloc() : super(ProfileInitial());
  // final accountDrugs ;

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is GetAccountDrugs) {
      yield ProfileLoading();

      try {
        final response = await _client.getAccountDrugs(email: await AccountUtils.accountEmail);

        if (response.response.statusCode ==200) {
          this.drugs = response.data;
          debugPrint('$response');
          yield ProfileSuccess(message: 'Get drugs successful!');
        } else {
          yield ProfileFailure(
              error: 'Failed to get drugs. Please check your credentials.');
        }
      } catch (e) {
        yield ProfileFailure(
            error:
            'Failed to connect to the server. Please check your internet connection.');
      }
    }
    if (event is AddAccountDrug) {
      yield ProfileLoading();

      try {
        var drugId = '[' + event.drugId + ']';
        final response = await dio.post('/account/addDrugs', data: drugId);

        if (response == true) {
          debugPrint('$response');
          yield ProfileSuccess(message: 'Add drugs successful!');
        } else {
          yield ProfileFailure(
              error: 'Failed to add drugs.');
        }
      } catch (e) {
        yield ProfileFailure(
            error:
            'Failed to connect to the server. Please check your internet connection.');
      }
    }

    if (event is RemoveAccountDrug) {
      yield ProfileLoading();

      try {
        var drugId = '[' + event.drugId + ']';
        final response = await dio.post('/account/removeDrugs', data: drugId);

        if (response == true) {
          debugPrint('$response');
          yield ProfileSuccess(message: 'Remove drugs successful!');
        } else {
          yield ProfileFailure(
              error: 'Failed to remove drugs.');
        }
      } catch (e) {
        yield ProfileFailure(
            error:
            'Failed to connect to the server. Please check your internet connection.');
      }
    }
  }
}
