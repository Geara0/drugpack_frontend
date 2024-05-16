import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../dto/drug/drug_dto.dart';

part 'get_account_drugs.freezed.dart';
part 'get_account_drugs.g.dart';

@Freezed(unionKey: "status")
class GetAccountDrugsResponse with _$GetAccountDrugsResponse {
  const factory GetAccountDrugsResponse.ok({
    @Default([]) List<DrugDto> drugs,
  }) = GetAccountDrugsResponseOk;

  const factory GetAccountDrugsResponse.error({
    required String error,
  }) = GetAccountDrugsResponseError;

  factory GetAccountDrugsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountDrugsResponseFromJson(json);
}