
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/api/controllers/profile_api_controller.dart';
import 'package:store/models/profile.dart';


import '../api/controllers/product_api_controller.dart';
import '../models/product_details.dart';



class ProfileGetxController extends GetxController {
  final ProfileApiController profileApiController = ProfileApiController();
  RxList<Profile> profile = <Profile>[].obs;

  RxBool loading = false.obs;


  static ProfileGetxController get to => Get.find();

  Future<void> getProfile() async {
    loading.value = true;
    profile.value = await profileApiController.getProfile();
    loading.value = false;
    update();
  }


  void onInit() {
    super.onInit();
    getProfile();
  }


}