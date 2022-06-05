import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class SharedPreferencesController {

  static SharedPreferencesController instance = SharedPreferencesController._();
  late SharedPreferences sharedPreferences;

  SharedPreferencesController._();

  factory SharedPreferencesController() {
    return instance;
  }

  Future<void> initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String get languageCode => sharedPreferences.getString('language_code') ?? 'en';

  Future<bool> setLanguage(String languageCode) async {
    return await sharedPreferences.setString('language_code', languageCode);
  }

  Future<void> save({required User user}) async {
    await sharedPreferences.setBool('logged_in', true);
    await sharedPreferences.setString('token', "Bearer ${user.token}");

  }

  User? get user {
    User user = User();
    user.token = sharedPreferences.getString('token') ?? '';

    return user;
  }

  bool get loggedIn => sharedPreferences.getBool('logged_in') ?? false;
  String get token => sharedPreferences.getString('token') ?? '';

  Future<bool> logout() async {
    return await sharedPreferences.clear();
  }
}
