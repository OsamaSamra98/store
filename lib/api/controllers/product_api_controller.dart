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

  Future<List<ProductDetails>> getAllProducts() async {
    var response = await http.get(getUrl(ApiSettings.PRODUCT_DETAILS),
        headers: {
      'Accept':'application/json', 'X-Requested-With': 'XMLHttpRequest',
    });
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body) as List;
      List<ProductDetails> Products = data.map((e) => ProductDetails.fromJson(e)).toList();
      return Products;
    }
    return [];
  }



  Future<ProductDetails?> getProductDetails({required int id}) async {
    var response = await http.get(
        getUrl(ApiSettings.PRODUCT_DETAILS +'/$id'),
        headers: {
          'X-Requested-With': 'XMLHttpRequest',      'Accept':'application/json',

        });
    if (isSuccessRequest(response.statusCode)) {
      var data = jsonDecode(response.body);
      var productDetails = ProductDetails.fromJson(data);
      return productDetails;
    }
  }




}
