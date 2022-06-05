import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/product_details.dart';
import '../../shared_preferences/preferences.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;

import '../helper/api_mixin.dart';

class ProductApiController with ApiMixin {

  Future<List<ProductDetails>> getProduct({required int id}) async {
    var response = await http.get(getUrl(ApiSettings.PRODUCT+'/$id'),headers: header);
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body) as List;
      List<ProductDetails> products = data.map((e) => ProductDetails.fromJson(e)).toList();
      return products;
    }
    return [];
  }

  Future<List<ProductDetails>> getAllProducts() async {
    var response = await http.get(getUrl(ApiSettings.PRODUCT_DETAILS),headers: {
      'Accept':'application/json',
      HttpHeaders.authorizationHeader: SharedPreferencesController().token,
      'X-Requested-With': 'XMLHttpRequest',
    });
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body) as List;
      List<ProductDetails> favoriteProducts = data.map((e) => ProductDetails.fromJson(e)).toList();
      return favoriteProducts;
    }
    return [];
  }



  Future<ProductDetails?> getProductDetails({required int id}) async {
    var response = await http.get(
        getUrl(ApiSettings.PRODUCT_DETAILS +'/$id'),
        headers: {
          HttpHeaders.authorizationHeader: SharedPreferencesController().token,
          'X-Requested-With': 'XMLHttpRequest',
          'lang': SharedPreferencesController().languageCode,
        });
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body)['object'];
      var productDetails = ProductDetails.fromJson(data);
      return productDetails;
    }
  }




}
