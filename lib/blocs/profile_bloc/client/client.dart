import 'package:dio/dio.dart';
import 'package:drugpack/dto/drug/drug_dto.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi()
abstract class ProfileClient {
  factory ProfileClient(Dio dio, {String baseUrl}) = _ProfileClient;

  @POST('/account/drugs')
  Future<HttpResponse<List<DrugDto>>> getAccountDrugs();

  @POST('/account/conditions')
  Future<String> getAccountConditions({
    @Field() required String email,
  });

  @POST('/account/addDrugs')
  Future<String> addAccountDrugs({
    @Field() required String drugId,
  });

  @POST('/account/removeDrugs')
  Future<String> removeAccountDrugs({
    @Field() required String drugId,
  });

  @POST('/account/addConditions')
  Future<String> addAccountConditions({
    @Field() required String email,
  });
}
