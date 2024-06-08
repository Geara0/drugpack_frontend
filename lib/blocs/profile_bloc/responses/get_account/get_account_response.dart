import 'package:drugpack/dto/compatibility/compatibility_dto.dart';
import 'package:drugpack/dto/condition/condition_dto.dart';
import 'package:drugpack/dto/drug/drug_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_account_response.freezed.dart';
part 'get_account_response.g.dart';

@Freezed(genericArgumentFactories: true)
class GetAccountResponse with _$GetAccountResponse {
  const factory GetAccountResponse({
    @Default([]) List<DrugDto> drugs,
    @Default([]) List<ConditionDto> conditions,
    @Default([]) List<CompatibilityDto> compatibilites,
  }) = _GetAccountResponse;

  // const factory GetAccountResponse.error({
  //   required String error,
  // }) = GetAccountResponseError;

  factory GetAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountResponseFromJson(json);
}
