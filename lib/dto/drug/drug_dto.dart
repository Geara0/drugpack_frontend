import 'package:freezed_annotation/freezed_annotation.dart';

part 'drug_dto.freezed.dart';
part 'drug_dto.g.dart';

@freezed
class DrugDto with _$DrugDto {
  const factory DrugDto({
    required int id,
    required String name,
    String? packaging,
    required String firm,
  }) = _DrugDto;

  factory DrugDto.fromJson(Map<String, dynamic> json) =>
      _$DrugDtoFromJson(json);
}