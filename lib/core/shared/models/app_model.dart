class App {
  String? deviceId;
  String? deviceName;
  String? osVersion;
  int? platformId;
  int? appVersionCode;

  App({
    this.deviceId,
    this.deviceName,
    this.osVersion,
    this.platformId,
    this.appVersionCode,
  });
  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "deviceName": deviceName,
        "osVersion": osVersion,
        "platformId": platformId,
        "appVersionCode": appVersionCode,
      };
}
