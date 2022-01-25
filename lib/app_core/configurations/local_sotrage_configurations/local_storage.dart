import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final storage = const FlutterSecureStorage();

  Future<dynamic> read(String key) {
    return storage.read(key: key);
  }

  Future<void> write(String key, String value) {
    return storage.write(key: key, value: value);
  }

  Future<void> delete(String key) {
    return storage.delete(key: key);
  }

  Future<void> deleteAll() {
    return storage.deleteAll();
  }

  Future<Map<String, String>> readAll() {
    return storage.readAll();
  }
}

class LocalStorageKey {
  static const String user = "user";
  static const String driver = "driver";
  static const String loginStatue = "loginstatue";
  static const String loginType = "logintype";
  static const String username = "username";
  static const String userId = "userId";
  static const String password = "password";
  static const String token = "token";
  static const String applang = "applang";
  static const String profileUpdated = "profileupdated";
}
