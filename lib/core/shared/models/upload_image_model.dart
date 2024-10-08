// To parse this JSON data, do
//
//     final uploadImageModel = uploadImageModelFromJson(jsonString);

import 'dart:convert';

UploadFileModel uploadFileModelFromJson(String str) =>
    UploadFileModel.fromJson(json.decode(str));

class UploadFileModel {
  final int response;
  final String? message;
  final Data data;

  UploadFileModel({
    required this.response,
    this.message,
    required this.data,
  });

  factory UploadFileModel.fromJson(Map<String, dynamic> json) => UploadFileModel(
        response: json["response"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  final String? fileName;
  final int contentLength;
  final String? url;

  Data({
    this.fileName,
    required this.contentLength,
    this.url,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fileName: json["fileName"],
        contentLength: json["contentLength"],
        url: json["url"],
      );
}
