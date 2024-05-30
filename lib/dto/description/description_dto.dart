import 'package:freezed_annotation/freezed_annotation.dart';

part 'description_dto.freezed.dart';
part 'description_dto.g.dart';

@freezed
class DescriptionDto with _$DescriptionDto {
  const factory DescriptionDto({
    String? composition,
    String? compositionDf,
    String? characteristics,
    String? pharmaActions,
    String? actonOrg,
    String? componentsProperties,
    String? drugFormDescription,
    String? pharmaKinetic,
    String? pharmaDynamic,
    String? pharmaProperties,
    String? clinicalPharmacology,
    String? direction,
    String? indications,
    String? recommendations,
    String? contraindications,
    String? pregnancyUse,
    String? useMethodAndDoses,
    String? instrForPac,
    String? sideActions,
    String? interactions,
    String? overdose,
    String? precautions,
    String? specialGuidelines,
    String? form,
    String? aptekaCondition,
    String? literature,
    String? comment,
    String? manufacturer,
    String? apply,
    String? complectation,
    String? principle,
    String? mainTechChars,
    String? observation,
    String? specification,
    String? service,
    String? pharmGroups,
    String? pharmActions,
    String? name,
    String? nameShort,
    String? amount,
    String? packing,
    String? packingShort,
    String? barcode,
    String? firm,
    String? lifetimeText,
    double? lifetimeMonth,
    String? storageConditions,
    String? storageConditionsShort,
    String? picname,
  }) = _DescriptionDto;

  factory DescriptionDto.fromJson(Map<String, dynamic> json) =>
      _$DescriptionDtoFromJson(json);
}
