// ignore_for_file: body_might_complete_normally_nullable

import 'package:task_manager_app/app/features/auth/data/models/refresh_token.dart';
import 'package:task_manager_app/app/features/preferences/logic/cubit/preferences_cubit.dart';
import 'package:task_manager_app/core/api/api.dart';
import 'package:task_manager_app/core/api/api_client.dart';
import 'package:task_manager_app/core/api/interceptors/logger_interceptor.dart';
import 'package:task_manager_app/core/databases/secure_storage/secure_storage.dart';
import 'package:task_manager_app/core/helpers/constants.dart';
import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/task_manager_app.dart';

class AuthRepo {
  Future<int?> logout() async {
    var response = await ApiClient().dio.post(Api.logout);
    return response.statusCode;
  }

  Future<RefreshTokenModel> refreshToken() async {
    String? accessToken = await SecureStorage().getAccessToken();
    String? refreshToken = await SecureStorage().getRefreshToken();
    final res = await ApiClient()
        .dio
        .post(Api.refreshToken, options: Options(extra: {'token': false}), data: {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
    });
    return RefreshTokenModel.fromJson(res.data);
    // return RefreshTokenModel.fromJson({});
  }

  Future<RefreshTokenModel> refreshTokenBeforeTokenExpiredTime() async {
    String? accessToken = await SecureStorage().getAccessToken();
    String? refreshToken = await SecureStorage().getRefreshToken();
    var options = BaseOptions(
        baseUrl: Api.baseUrl,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
        headers: {
          // ignore: use_build_context_synchronously
          "lang": navigatorKey.currentState!.context
              .read<PreferencesCubit>()
              .getLanguageName(),
          "authenticationKey": Constants.authenticationKey,
        });
    Dio dio = Dio(options);
    dio.interceptors.addAll({
      LoggerInterceptor(
        logRequestTimeout: false,
        logRequestHeaders: true,
        logResponseHeaders: false,
      ),
    });
    final res = await dio.post(Api.refreshToken, data: {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
    });
    return RefreshTokenModel.fromJson(res.data);
  }
}
