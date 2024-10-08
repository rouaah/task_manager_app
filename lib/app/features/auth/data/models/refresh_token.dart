// To parse this JSON data, do
//
//     final refreshTokenModel = refreshTokenModelFromJson(jsonString);

import 'dart:convert';

RefreshTokenModel refreshTokenModelFromJson(String str) =>
    RefreshTokenModel.fromJson(json.decode(str));

String refreshTokenModelToJson(RefreshTokenModel data) => json.encode(data.toJson());

class RefreshTokenModel {
  Data data;
  int response;
  String message;

  RefreshTokenModel({
    required this.data,
    required this.response,
    required this.message,
  });

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) => RefreshTokenModel(
        data: Data.fromJson(json["data"]),
        response: json["response"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "response": response,
        "message": message,
      };
}

class Data {
  String accessToken;
  String issuedAt;
  String expiration;
  String refreshToken;
  dynamic user;

  Data({
    required this.accessToken,
    required this.issuedAt,
    required this.expiration,
    required this.refreshToken,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"] ?? '',
        issuedAt: json["issuedAt"] ?? '',
        expiration: json["expiration"] ?? '',
        refreshToken: json["refreshToken"] ?? '',
        user: json["user"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "issuedAt": issuedAt,
        "expiration": expiration,
        "refreshToken": refreshToken,
        "user": user,
      };
}
