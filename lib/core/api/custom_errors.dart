import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../app/translations/text_keys.dart';

//TODO: complete the translation
class BadRequestException extends DioException {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return T.invalidRequest.tr();
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return T.internalServerErrorException.tr();
  }
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return T.conflictException.tr();
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return T.accessDenied.tr();
  }
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return T.notFoundException.tr();
  }
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return T.noInternetConnectionException.tr();
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return T.deadlineExceededException.tr();
  }
}

class CustomException extends DioException {
  CustomException(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);
  @override
  String toString() {
    return "LocaleKeys.customException.tr()";
  }
}

class InvalidLogin extends DioException {
  InvalidLogin(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return T.invalidLogin.tr();
  }
}

class InvalidPermission extends DioException {
  InvalidPermission(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);
  @override
  String toString() {
    return T.invalidPermission.tr();
  }
}

class IncorrectOldPassword extends DioException {
  IncorrectOldPassword(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);
  @override
  String toString() {
    return T.incorrectOldPassword.tr();
  }
}

class CustomUnAuthorized extends DioException {
  CustomUnAuthorized(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return 'custom unauthorized';
  }
}

class InvalidData extends DioException {
  InvalidData(RequestOptions r, Response<dynamic>? response)
      : super(requestOptions: r, response: response);
  @override
  String toString() {
    return T.invalidData.tr();
  }
}

class InvalidBalance extends DioException {
  InvalidBalance(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return "Invalid Balance".tr();
  }
}

class BroadcastDurationTimeout extends DioException {
  BroadcastDurationTimeout(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return "Broadcast Duration Timeout".tr();
  }
}

class EmailIsNotRegistered extends DioException {
  EmailIsNotRegistered(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() {
    return "this email is not registered!".tr();
  }
}
