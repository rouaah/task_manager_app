import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../app/features/auth/data/repos/auth_repo.dart';
import '../databases/secure_storage/secure_storage.dart';
import './custom_errors.dart' as custom_errors;
import 'api_client.dart';

class RefreshToken {
  static void handle401(DioException err, ErrorInterceptorHandler handler) async {
    try {
      var refreshToken = await SecureStorage().getRefreshToken();
      if (refreshToken != null) {
        await _refreshToken(err.requestOptions);
        return handler.resolve(await _retry(err.requestOptions));
      } else {
        throw custom_errors.UnauthorizedException(err.requestOptions, err.response);
      }
    } on DioException catch (error) {
      handler.next(error);
    } catch (error) {
      throw custom_errors.UnauthorizedException(err.requestOptions, err.response);
    }
  }

  static Future<void> _refreshToken(RequestOptions requestOptions) async {
    if (requestOptions.headers['Retry-Count'] != 1) {
      var res = await AuthRepo().refreshToken();
      await saveAuthData(res.data.accessToken, res.data.refreshToken);
      requestOptions.headers['Retry-Count'] = 1;
    }
  }

  static Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return await ApiClient().dio.request<dynamic>(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: options,
        );
  }

  static Future<void> getAndSetAccessTokenVariable(
      Dio dio, RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      var res = await AuthRepo().refreshTokenBeforeTokenExpiredTime();
      await saveAuthData(res.data.accessToken, res.data.refreshToken);
      options.headers['Retry-Count'] = 1;
    } on DioException catch (e) {
      handler.reject(e, true);
    }
  }

  static Future<void> saveAuthData(String accessToken, String refreshToken) async {
    await saveTokenExpiration(accessToken);
    await SecureStorage().saveAccessToken(accessToken);
    await SecureStorage().saveRefreshToken(refreshToken);
  }

  static Future<void> saveTokenExpiration(String token) async {
    var res = JwtDecoder.decode(token);
    if (res["orig_iat"] != null) {
      var origIat =
          DateTime.fromMillisecondsSinceEpoch(res["orig_iat"] * 1000, isUtc: true);
      var exp = DateTime.fromMillisecondsSinceEpoch(res["exp"] * 1000, isUtc: true);
      var tokenExp = DateTime.now().add(exp.difference(origIat));
      await SecureStorage().saveExpiration(tokenExp.toString());
    } else {
      await SecureStorage().saveExpiration(
          DateTime.fromMillisecondsSinceEpoch(res["exp"] * 1000).toString());
    }
  }
}
