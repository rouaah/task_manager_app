import 'package:dio/dio.dart';
import 'package:task_manager_app/core/api/custom_errors.dart';

class ResponseInterceptor extends Interceptor {
  Dio dio;

  ResponseInterceptor(this.dio);
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.data['response'] != 1) {
      handler.reject(
        CustomException(response.requestOptions, response),
        true,
      );
    } else {
      return handler.next(response);
    }
  }
}
