import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_dto.freezed.dart';
part 'condition_dto.g.dart';

@freezed
class ConditionDto with _$ConditionDto {
  const factory ConditionDto({
    required int id,
    required String synonymName,
  }) = _ConditionDto;

  factory ConditionDto.fromJson(Map<String, dynamic> json) =>
      _$ConditionDtoFromJson(json);
}
