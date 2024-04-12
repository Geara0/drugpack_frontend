import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _storage = FlutterSecureStorage();

abstract class AccountUtils {
  static setAccountKey(String key) {
    _storage.write(key: 'token', value: key);
  }

  static Future<String?> get accountKey {
    return _storage.read(key: 'token');
  }
}
