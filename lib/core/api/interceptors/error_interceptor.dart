import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:task_manager_app/app/features/auth/logic/cubit/authentication_cubit.dart';
import 'package:task_manager_app/core/api/refresh_token.dart';
import 'package:task_manager_app/task_manager_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../custom_errors.dart' as custom_errors;
import '../custom_errors.dart';

class ErrorInterceptor extends Interceptor {
  // final _storage = SecureStorage();

  ErrorInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw custom_errors.DeadlineExceededException(err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            // throw InvalidLogin(err.requestOptions, err.response);
            if (err.response != null) {
              switch (err.response!.data['response']) {
                case 12:
                  throw InvalidData(err.requestOptions, err.response);
                case 27:
                  throw InvalidBalance(err.requestOptions);
                case 44:
                  throw BroadcastDurationTimeout(err.requestOptions);
                case 33:
                  throw EmailIsNotRegistered(err.requestOptions);
                default:
                  throw custom_errors.BadRequestException(err.requestOptions);
              }
            } else {
              throw custom_errors.BadRequestException(err.requestOptions);
            }
          case 401:
            if (err.response != null &&
                err.response!.data != "" &&
                err.response!.data != null) {
              switch (err.response!.data['response']) {
                case 13:
                  BlocProvider.of<AuthenticationCubit>(navigatorKey.currentState!.context)
                      .clear();
                  // MyApp.navigatorKey.currentState!.context
                  //     .goUntil(WelcomeScreen.routeName);
                  throw custom_errors.UnauthorizedException(
                      err.requestOptions, err.response);
                case 14:
                  throw InvalidLogin(err.requestOptions, err.response);
                case 15:
                  throw InvalidLogin(err.requestOptions, err.response);
                default:
                  throw custom_errors.UnauthorizedException(
                      err.requestOptions, err.response);
              }
            } else {
              return RefreshToken.handle401(err, handler);
            }
          case 403:
            throw custom_errors.UnauthorizedException(err.requestOptions, err.response);
          case 404:
            throw custom_errors.NotFoundException(err.requestOptions);
          case 409:
            throw custom_errors.ConflictException(err.requestOptions);
          case 500:
            throw custom_errors.InternalServerErrorException(
                err.requestOptions, err.response);
          default:
            throw custom_errors.InternalServerErrorException(
                err.requestOptions, err.response);
        }
      // break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        if (err is CustomUnAuthorized) {
          return RefreshToken.handle401(err, handler);
        } else if (err.response != null) {
          switch (err.response!.data['Response']) {
            case 15:
              throw (custom_errors.InvalidLogin(err.requestOptions, err.response));
            case 12:
              throw (custom_errors.InvalidData(err.requestOptions, err.response));
            case 401:
              throw (custom_errors.UnauthorizedException(
                  err.requestOptions, err.response));
            case 26:
              throw custom_errors.IncorrectOldPassword(err.requestOptions, err.response);
            case 230:
              throw custom_errors.InvalidPermission(err.requestOptions, err.response);
            default:
              log(err.response.toString());
              throw custom_errors.NoInternetConnectionException(err.requestOptions);
          }
        } else {
          throw custom_errors.NoInternetConnectionException(err.requestOptions);
        }
      default:
        log(err.response.toString());
        throw custom_errors.NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }
}
