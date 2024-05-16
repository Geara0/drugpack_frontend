import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _storage = FlutterSecureStorage();

abstract class AccountUtils {
  static setAccountKey(String key) {
    _storage.write(key: 'token', value: key);
  }
  static setAccountEmail(String key) {
    _storage.write(key: 'email', value: key);
  }

  static Future<String?> get tryAccountKey {
    return _storage.read(key: 'token');
  }
  static Future<String> get accountKey {
    return _storage.read(key: 'token').then((value) => value!);
  }
  static Future<String?> get tryAccountEmail {
    return _storage.read(key: 'email');
  }
  static Future<String> get accountEmail {
    return _storage.read(key: 'email').then((value) => value!);
  }
}
