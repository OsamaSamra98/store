import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:store/screens/Home/home_screen.dart';

import '../getx/categories_getx_controller.dart';
import '../getx/product_getx_controller.dart';
import '../getx/profile_getx_controller.dart';
import '../getx/user_getx_controller.dart';
import '../shared_preferences/preferences.dart';
import 'login/login_Screen.dart';

class launch_screen extends StatefulWidget {
  const launch_screen({Key? key}) : super(key: key);

  @override
  _launch_screenState createState() => _launch_screenState();
}

class _launch_screenState extends State<launch_screen> {
  UsersGetxController usersController = Get.put(UsersGetxController());
  ProductGetxController controller = Get.put(ProductGetxController());
  ProfileGetxController profileGetxController = Get.put(ProfileGetxController());


  @override
  void initState() {
    Widget route = SharedPreferencesController().loggedIn
        ? home_Screen()
        : login_Screen();
    Future.delayed(Duration(seconds: 3), () => Get.off(route));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            color: Colors.transparent,
          ),
          Text(
            'Nova Store',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'NunitoSans'
            ),
          ),
        ],
      ),
    );
  }
}
