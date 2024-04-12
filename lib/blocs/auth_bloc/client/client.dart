
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String baseUrl}) = _AuthClient;

  @POST('auth/signUp')
  Future<String> signUp({
    @Field() required String email,
    @Field() required String password,
  });

  @POST('auth/signIn')
  Future<String> signIn({
    @Field() required String email,
    @Field() required String password,
  });

  @POST('auth/restore')
  Future<String> restore({
    @Field() required String email,
  });
}
