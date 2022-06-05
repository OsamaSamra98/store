//
// import 'package:get/get.dart';
//
// import '../api/controllers/category_api_controller.dart';
//
//
// class CategoryGetxController extends GetxController {
//   final CategoryApiController categoryApiController = CategoryApiController();
//
//   static CategoryGetxController get to => Get.find();
//
//   void onInit() {
//     getCategory();
//     super.onInit();
//   }
//
//   Future<void> getCategory() async {
//     categories.value = await categoryApiController.getCategory();
//     update();
//   }
//
//
// }
