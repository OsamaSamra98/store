import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/screens/Home/home_screen.dart';

import '../../getx/user_getx_controller.dart';
import '../../mixins/helpers.dart';
import '../../utils/app_text.dart';
import '../../utils/app_textfield.dart';
import '../../utils/helper.dart';


class login_Screen extends StatefulWidget {
  const login_Screen({Key? key}) : super(key: key);

  @override
  _login_ScreenState createState() => _login_ScreenState();
}

class _login_ScreenState extends State<login_Screen> with Helpers{
  late TextEditingController userNameEditingController;
  late TextEditingController passwordEditingController;
  late TapGestureRecognizer recognizer;

  @override
  void initState() {
    super.initState();
    userNameEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    recognizer = TapGestureRecognizer();
  }

  @override
  void dispose() {
    userNameEditingController.dispose();
    passwordEditingController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:Color(0XFFFAFAFA),
      body: Padding(
        padding: EdgeInsets.only(
            left: 25, top: 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'Hello There',
              color: Colors.grey,
              fontsize: 16,
            ),
            SizedBox(
              height: 25,
            ),
            AppText(
              text: 'Welcome Back',
              color: Colors.black,
              fontsize: 22,
              fontWeight: FontWeight.bold,
            ),
            app_textfield(
              title: 'UserName',
              controller:userNameEditingController ,
            ),
            app_textfield(
              title: 'Password',
              controller:passwordEditingController ,

              toppadding: 20,
              secure: true,
            ),
            SizedBox(
              height: 20,
            ),

            Padding(
              padding: EdgeInsets.only(
                  right:25,
                  top: 265),
              child: ElevatedButton(
                onPressed: () async {
                  await performLogin();
                },
                child: AppText(
                  text: 'Login',
                  color: Colors.white,
                  fontsize: 16,
                  fontWeight: FontWeight.bold,
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(double.infinity, 64),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (userNameEditingController.text.isNotEmpty &&
        passwordEditingController.text.isNotEmpty) {
      return true;
    }
    Helper.showSnackBar(context, text: 'Enter Required Fields', error: true);
    return false;
  }

  Future<void> login() async {
    bool status = await UsersGetxController.to.login(
      context: context,
      username: userNameEditingController.text,
      password: passwordEditingController.text,


    );
    if (status) {
      Get.offAll(home_Screen());
    } else {
      Helper.showSnackBar(context, text: 'Login failed, check your credentials!', error: true);
    }
  }
}

