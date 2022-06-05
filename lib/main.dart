import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/screens/launch_screen.dart';
import 'package:store/shared_preferences/preferences.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesController().initSharedPreference();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
debugShowCheckedModeBanner: false,
      home: launch_screen(),
    );
  }
}
