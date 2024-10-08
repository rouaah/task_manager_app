import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer' as developer;

class SecureStorage {
  static SecureStorage? _instance;

  factory SecureStorage() => _instance ??= SecureStorage._(const FlutterSecureStorage());

  SecureStorage._(this._storage);

  final FlutterSecureStorage _storage;
  static const _accessToken = 'AccessTOKEN';
  static const _refreshToken = 'RefreshTOKEN';
  static const _expiration = 'Expiration';
///////////////////////////////////////

  Future<void> saveAccessToken(String accessToken) async {
    await _storage.write(key: _accessToken, value: accessToken);
    developer.log('accessToken: $accessToken saved now in secure_storage');
  }

  Future<bool> hasAccessToken() async {
    var value = await _storage.read(key: _accessToken);
    return value != null;
  }

  Future<String?> getAccessToken() async => _storage.read(key: _accessToken);

///////////////////////////////////////

  Future<void> saveRefreshToken(String refreshToken) async {
    await _storage.write(key: _refreshToken, value: refreshToken);
    developer.log('refreshToken: $refreshToken saved now in secure_storage');
  }

  Future<String?> getRefreshToken() async => _storage.read(key: _refreshToken);

///////////////////////////////////////

  Future<void> saveExpiration(String expiration) async {
    await _storage.write(key: _expiration, value: expiration);
    developer.log('expiration: $expiration saved now in secure_storage');
  }

  Future<String?> getExpiration() async => _storage.read(key: _expiration);

///////////////////////////////////////
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
