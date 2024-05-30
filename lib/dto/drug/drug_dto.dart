import 'package:freezed_annotation/freezed_annotation.dart';
import '../active_substance/active_substance_dto.dart';
import '../description/description_dto.dart';

part 'drug_dto.freezed.dart';
part 'drug_dto.g.dart';

@freezed
class DrugDto with _$DrugDto {
  const factory DrugDto({
    required int id,
    required String name,
    String? packaging,
    String? firm,
    DescriptionDto? description,
    ActiveSubstanceDto? activeSubstance,
    String? lifetimeText,
    double? lifetimeMonth,
    String? storageConditions,
    String? storageConditionsShort,
    String? picname,
    String? form,
  }) = _DrugDto;

  factory DrugDto.fromJson(Map<String, dynamic> json) =>
      _$DrugDtoFromJson(json);
}
