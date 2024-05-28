import 'package:dio/dio.dart';
import 'package:drugpack/utils/account_utils.dart';
import 'package:flutter/cupertino.dart';

final dio = Dio()
  ..options = BaseOptions(
    baseUrl: 'http://192.168.0.100:8080/',
    sendTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  )
  ..interceptors.addAll([_TokenInterceptor()]);

class _TokenInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String? token = await AccountUtils.tryAccountKey;

    debugPrint(token);

    if (token == null) {
      super.onRequest(options, handler);
      return;
    }
    options.headers.addAll({
        'Authorization': 'Bearer $token',});

    if (options.data is FormData) {
      (options.data as FormData).fields.addAll([
        MapEntry('accessToken', token),
      ]);
      super.onRequest(options, handler);
      return;
    }

    options.data = options.data.toString();
    super.onRequest(options, handler);
    onResponse:
    (Response response, ResponseInterceptorHandler handler) {
      // Do something with response data.
      // If you want to reject the request with a error message,
      // you can reject a `DioException` object using `handler.reject(dioError)`.
      return handler.next(response);
    };
    onError:
    (DioException error, ErrorInterceptorHandler handler) {
      // Do something with response error.
      // If you want to resolve the request with some custom data,
      // you can resolve a `Response` object using `handler.resolve(response)`.
      return handler.next(error);
    };
  }
}
