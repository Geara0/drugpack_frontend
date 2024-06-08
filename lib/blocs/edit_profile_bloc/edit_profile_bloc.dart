import 'package:drugpack/dto/drug/drug_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../client/dio.dart';
import 'client/client.dart';

part 'edit_profile_state.dart';
part 'edit_profile_event.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final _client = EditProfileClient(dio);

  List<DrugDto> drugs = [];
  EditProfileBloc() : super(EditProfileInitial());
  // final accountDrugs ;

  @override
  Stream<EditProfileState> mapEventToState(EditProfileEvent event) async* {
    if (event is GetAccountDrugs) {
      yield EditProfileLoading();

      try {
        final response = await _client.getAccountDrugs();

        if (response.response.statusCode == 200) {
          debugPrint('$response');
          yield EditProfileSuccess(message: 'Get drugs successful!');
        } else {
          yield EditProfileFailure(
              error: 'Failed to get drugs. Please check your credentials.');
        }
      } catch (e) {
        yield EditProfileFailure(
            error:
                'Failed to connect to the server. Please check your internet connection.');
      }
    }
    if (event is AddAccountDrug) {
      yield EditProfileLoading();

      try {
        var drugId = '[' + event.drugId + ']';
        final response = await dio.post('/account/addDrugs', data: drugId);

        if (response == true) {
          debugPrint('$response');
          yield EditProfileSuccess(message: 'Add drugs successful!');
        } else {
          yield EditProfileFailure(error: 'Failed to add drugs.');
        }
      } catch (e) {
        yield EditProfileFailure(
            error:
                'Failed to connect to the server. Please check your internet connection.');
      }
    }

    if (event is RemoveAccountDrug) {
      yield EditProfileLoading();

      try {
        var drugId = '[' + event.drugId + ']';
        final response = await dio.post('/account/removeDrugs', data: drugId);

        if (response == true) {
          debugPrint('$response');
          yield EditProfileSuccess(message: 'Remove drugs successful!');
        } else {
          yield EditProfileFailure(error: 'Failed to remove drugs.');
        }
      } catch (e) {
        yield EditProfileFailure(
            error:
                'Failed to connect to the server. Please check your internet connection.');
      }
    }
  }
}
