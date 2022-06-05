import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../shared_preferences/preferences.dart';
import '../api_settings.dart';
import '../helper/api_mixin.dart';

class UserApiController with ApiMixin {
  Future<User?> login(BuildContext context,
      {required String username,
      required String password,
     }) async {
    var response = await http.post(getUrl(ApiSettings.LOGIN),
        body: {'username': username, 'password': password, },
        headers: baseHeader);
    if (isSuccessRequest(response.statusCode)) {
      return User.fromJson(jsonDecode(response.body));
    } else if (response.statusCode != 500) {
      showMessage(context, response, error: true);
      return null;
    }
    handleServerError(context);
    return null;
  }

  Future<bool> logout(BuildContext context) async {
    var response = await http.get(
      getUrl(ApiSettings.LOGOUT),
      headers: requestHeaders,
    );
    print(response.statusCode);
    if (response.statusCode == 200 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      await SharedPreferencesController().logout();
      return true;
    } else {
      handleServerError(context);
    }
    return false;
  }


}
