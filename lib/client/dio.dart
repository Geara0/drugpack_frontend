import 'dart:convert';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:dio/dio.dart';

final dio = Dio()
  ..options = BaseOptions(
    baseUrl: 'http://localhost:8080/',
    sendTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
  )
  ..interceptors.addAll([])
  ..httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.findProxy = (uri) {
        return 'PROXY localhost:8080';
      };
      return client;
    },
  );
