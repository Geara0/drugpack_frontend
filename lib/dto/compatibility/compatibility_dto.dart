import 'package:freezed_annotation/freezed_annotation.dart';

part 'compatibility_dto.freezed.dart';
part 'compatibility_dto.g.dart';

@freezed
class CompatibilityDto with _$CompatibilityDto {
  const factory CompatibilityDto({
    required int leftAsId,
    required int rightAsId,
    required int classId,
    String? className,
    int? subclassId,
    String? subclassName,
    int? directionId,
    String? officialSrcName,
    String? officialSrcNote,
    String? officialSrcDate,
    String? alternativeSrcName,
    String? alternativeSrcNote,
    String? alternativeSrcDate,
  }) = _CompatibilityDto;

  factory CompatibilityDto.fromJson(Map<String, dynamic> json) =>
      _$CompatibilityDtoFromJson(json);
}
