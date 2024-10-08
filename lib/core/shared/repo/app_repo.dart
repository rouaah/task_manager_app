import 'package:task_manager_app/core/api/api.dart';
import 'package:task_manager_app/core/api/api_client.dart';
import 'package:task_manager_app/core/shared/models/upload_image_model.dart';
import 'package:http_parser/http_parser.dart';

import '../../Routes/barrel.dart';

class AppRepo {
  // Future<UploadFileModel?> uploadImage(
  //     {required String image, required int clientID}) async {
  //   File photo = File(image);
  //   String filename = photo.path.split('/').last;
  //   var formData = FormData.fromMap({
  //     "RefID": clientID,
  //     'Image': await MultipartFile.fromFile(
  //       image,
  //       filename: filename,
  //       contentType: MediaType('image', 'jpeg'),
  //     )
  //   }); // FormData.fromMap
  //   var response = await ApiClient().dio.post(Api.uploadImage,
  //       data: formData,
  //       options: Options(
  //         headers: {'Content-Type': 'multipart/form-data'},
  //       ));
  //   return UploadFileModel.fromJson(response.data);
  // }

  // Future<UploadFileModel?> uploadVoice(
  //     {required String voice, required int clientID}) async {
  //   File file = File(voice);
  //   String filename = file.path.split('/').last;
  //   var formData = FormData.fromMap({
  //     "RefID": clientID,
  //     'file': await MultipartFile.fromFile(
  //       voice,
  //       filename: filename,
  //       contentType: MediaType('audio', 'wav'),
  //     )
  //   }); // FormData.fromMap
  //   var response = await ApiClient().dio.post(Api.uploadVoice,
  //       data: formData,
  //       options: Options(
  //         headers: {'Content-Type': 'multipart/form-data'},
  //       ));
  //   return UploadFileModel.fromJson(response.data);
  // }
}
