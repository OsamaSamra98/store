import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../api/controllers/userApiContraller.dart';
import '../models/user.dart';
import '../shared_preferences/preferences.dart';


class UsersGetxController extends GetxController {
  UserApiController _userApiController = UserApiController();
  late User? user;

  static UsersGetxController get to => Get.find();

  @override
  void onInit() {
    if (SharedPreferencesController().loggedIn){
      user = SharedPreferencesController().user;
    }
    super.onInit();
  }

  Future<bool> login({required BuildContext context,required String username, required String password, }) async {
    User? user = await _userApiController.login(context, username: username, password: password,);
    if (user != null) {
      await SharedPreferencesController().save(user: user);
      this.user = user;
      return true;
    }
    return false;
  }


  Future<bool> logout(BuildContext context) async {
    return await _userApiController.logout(context);
  }


}
