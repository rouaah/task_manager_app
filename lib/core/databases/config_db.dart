import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'boxes/preferences_box.dart';

class ConfigDB {
  String encryptKey = '2023@%Sba7oHiveDB@%2024';

  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<void> initDB() async {
    // await checkEncryption();

    await Hive.openBox(PreferencesBox.boxName);
  }

  // Future<void> checkEncryption() async {
  //   var isencryptKeyExist = await secureStorage.containsKey(key: encryptKey);
  //   if (!isencryptKeyExist) {
  //     var secureKey = Hive.generateSecureKey();
  //     await secureStorage.write(
  //       key: encryptKey,
  //       value: base64UrlEncode(secureKey),
  //     );
  //   }
  // }
}
