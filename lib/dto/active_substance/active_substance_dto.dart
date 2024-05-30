import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_substance_dto.freezed.dart';
part 'active_substance_dto.g.dart';

@freezed
class ActiveSubstanceDto with _$ActiveSubstanceDto {
  const factory ActiveSubstanceDto({
    String? asNameRus,
    String? asNameEng,
    String? asNameLatGenitive,
    String? asNameLat,
    int? tcfsDescId,
    String? fdaCat,
    String? asFormula,
    String? asFormulaHtml,
    String? asCasCode,
    bool? asterisk,
  }) = _ActiveSubstanceDto;

  factory ActiveSubstanceDto.fromJson(Map<String, dynamic> json) =>
      _$ActiveSubstanceDtoFromJson(json);
}
