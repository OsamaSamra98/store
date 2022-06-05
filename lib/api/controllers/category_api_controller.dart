// import 'dart:convert';
//
// import '../../mixins/api_mixin.dart';
// import '../../models/category.dart';
// import '../api_settings.dart';
// import 'package:http/http.dart' as http;
//
// class CategoryApiController with ApiMixin {
//
//   Future<List> getCategory() async {
//     var response = await http.get(getUrl(ApiSettings.CATEGORY),headers: header);
//     if (isSuccessRequest(response.statusCode)) {
//       var data = jsonDecode(response.body) as List;
//       List<Category> categories = data.map((e) => Category.fromJson(e)).toList();
//       return categories;
//     }
//     return [];
//   }
//
// }