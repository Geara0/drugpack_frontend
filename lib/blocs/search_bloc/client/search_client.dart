import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'search_client.g.dart';


@RestApi()
abstract class SearchClient {
  factory SearchClient(Dio dio, {String baseUrl}) = _SearchClient;

  @POST('{searchRequest}')
  Future search({
    @Path('searchRequest') required request,
    required String search,
  });
}
