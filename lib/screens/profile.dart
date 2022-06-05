import 'package:flutter/material.dart';
import 'package:store/shared_preferences/preferences.dart';

import '../utils/app_text.dart';


class profile_screen extends StatefulWidget {
  const profile_screen({Key? key}) : super(key: key);

  @override
  _profile_screenState createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        centerTitle: true,
        title: AppText(
          text: 'Profile',
          fontWeight: FontWeight.bold,
          fontsize: 20,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Colors.transparent,
            ),
            profileWidget(
              icon: Icon(Icons.person_outline_sharp),
              text: 'Osama Abo Samra ',
            ),
            SizedBox(
              height: 20,
            ),
            profileWidget(
              icon: Icon(Icons.email_outlined),
              text: 'Osama Abo Samra ',
            ),
            SizedBox(
              height: 20,
            ),
            profileWidget(
              icon: Icon(Icons.phone),
              text: 'phone ',
            ),
            SizedBox(
              height: 20,
            ),
            profileWidget(
              icon: Icon(Icons.home_outlined),
              text: 'city ',
            ),
            SizedBox(
              height: 200,
            ),            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'LOGOUT',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  primary: Colors.red,
                  minimumSize: Size(250, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logout() async {
    print(SharedPreferencesController().token);
  }
}

class profileWidget extends StatelessWidget {
  final Icon icon;
  final String text;

  profileWidget({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(children: [
        icon,
        SizedBox(
          width: 15,
        ),
        Text(text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            )),
      ]),
    );
  }
}