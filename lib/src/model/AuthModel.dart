import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthModel {
  final storage = new FlutterSecureStorage();

  set Access(String token) {
    storage.write(key: "access_token", value: token);
  }

  set Refresh(String token) {
    storage.write(key: "refresh_token", value: token);
  }

  String get Access {
    return storage.read(key: "access_token") as String;
  }

  String get Refresh {
    return storage.read(key: "refresh_token") as String;
  }
}
