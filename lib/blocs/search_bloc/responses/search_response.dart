import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_response.freezed.dart';

part 'search_response.g.dart';

@Freezed(genericArgumentFactories: true)
class SearchResponse<T> with _$SearchResponse<T> {
  const factory SearchResponse({
    @Default([]) List<T> result,
  }) = _SearchResponse;

  factory SearchResponse.fromJson(
      List<dynamic> json,
      T Function(Object?) fromJsonT,
      ) {
    final List<T> resultList = json.map((e) => fromJsonT(e)).toList();
    return _SearchResponse(result: resultList);
  }
}
