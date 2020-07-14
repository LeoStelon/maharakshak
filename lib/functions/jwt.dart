import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

class JWTProvider extends ChangeNotifier {
  //flutter_secure_storage
  final storage = new FlutterSecureStorage();

  // Write value
  //Set Token
  void setToken(token) async {
    await storage.write(key: 'token', value: token);
    await storage.write(key: 'isLoggedIn', value: "true");
    notifyListeners();
  }

  //Remove Token
  Future<void> removeToken() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'isLoggedIn');
    notifyListeners();
  }

  //User State
  Future get user async {
    return await storage.read(key: "isLoggedIn");
  }

  //Token
  Future get token async {
    return await storage.read(key: "token");
  }
}
