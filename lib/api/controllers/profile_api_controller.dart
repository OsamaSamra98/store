import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:store/models/profile.dart';

import '../../models/product_details.dart';
import '../../shared_preferences/preferences.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;

import '../helper/api_mixin.dart';

class ProfileApiController with ApiMixin {


  Future getProfile() async {
    var response = await http.get(getUrl(ApiSettings.profile),
   headers: {
        'X-Requested-With': 'XMLHttpRequest',      'Accept':'application/json',

        });
    if (isSuccessRequest(response.statusCode)) {
      Map<String, dynamic> data =  Map<String, dynamic>.from(json.decode(response.body));

      return data;
    }
    return [];
  }








}
