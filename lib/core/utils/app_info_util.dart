import 'dart:developer';
import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:task_manager_app/core/shared/models/app_model.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:platform_device_id/platform_device_id.dart';

class AppConfig {
  static final AppConfig _instance = AppConfig._();

  AppConfig._();

  static AppConfig get instance => _instance;
  Future<String?> firebaseToken() async {
    // return await FirebaseMessaging.instance.getToken();
  }

  static Future<App?> getDeviceInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    App app = App();
    try {
      if (Platform.isAndroid) {
        await PlatformDeviceId.deviceInfoPlugin.androidInfo.then((value) async {
          app.deviceName = value.brand + value.model;
          app.osVersion = value.version.release;
          //TODO: must be float not int in the backend  //
          // app.appVersionCode = int.parse(packageInfo.version);
          app.deviceId = await PlatformDeviceId.getDeviceId;
          app.platformId = 1;
          return app;
        });
      } else {
        await PlatformDeviceId.deviceInfoPlugin.iosInfo.then((value) async {
          app.deviceName = value.name;
          app.osVersion = value.systemVersion;
          app.deviceId = await PlatformDeviceId.getDeviceId;
          app.platformId = 2;
        });
      }
      return app;
    } catch (error) {
      log(error.toString());
      return null;
    }
  }
}
