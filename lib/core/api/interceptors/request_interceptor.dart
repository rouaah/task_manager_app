import 'package:task_manager_app/app/features/preferences/logic/cubit/preferences_cubit.dart';
import 'package:task_manager_app/core/api/refresh_token.dart';
import 'package:task_manager_app/core/databases/secure_storage/secure_storage.dart';
import 'package:task_manager_app/core/helpers/constants.dart';
import 'package:task_manager_app/core/routes/barrel.dart';
import 'package:task_manager_app/task_manager_app.dart';

// import '../refresh_token.dart';

class RequestInterceptors extends QueuedInterceptorsWrapper {
  Dio dio;
  RequestInterceptors(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    bool withToken = options.extra['token'] ?? true;
    var lang =
        navigatorKey.currentState!.context.read<PreferencesCubit>().getLanguageName();
    if (withToken) {
      var token = await SecureStorage().getAccessToken();
      if (token != null) {
        if (options.headers['Retry-Count'] != 1) {
          var expiration = await SecureStorage().getExpiration();
          var tokenExp = DateTime.parse(expiration!);
          var difference = tokenExp.difference(DateTime.now());
          if (difference.isNegative) {
            await RefreshToken.getAndSetAccessTokenVariable(dio, options, handler);
            token = await SecureStorage().getAccessToken();
          }
        }
        options.headers.addAll({"Authorization": "Bearer $token"});
      }
    }
    options.headers.addAll({
      "lang": lang,
      "authenticationKey": Constants.authenticationKey,
    });
    return handler.next(options);
  }
}
