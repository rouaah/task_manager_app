import 'package:dio/dio.dart';

import 'api.dart';

import 'interceptors/logger_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/request_interceptor.dart';
import 'interceptors/response_interceptor.dart';

class ApiClient {
  final dio = createDio();
  ApiClient._internal();

  static final _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  static Dio createDio() {
    var dio = Dio(
      BaseOptions(
        baseUrl: Api.baseUrl,
        receiveTimeout: const Duration(seconds: 15), // 15 seconds
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );
    dio.interceptors.addAll({
      LoggerInterceptor(
        logRequestTimeout: false,
        logRequestHeaders: true,
        logResponseHeaders: false,
      ),
      RequestInterceptors(dio),
      ResponseInterceptor(dio),
      ErrorInterceptor(),
    });
    return dio;
  }
}
