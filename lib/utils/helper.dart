import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';


class Helper {
  static void showSnackBar(
    BuildContext context, {
    required String text,
    bool error = false,
    String? actionTitle,
    Function()? onPressed,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
           text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,

          ),

        ),
        backgroundColor: error ? Colors.redAccent : Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(right: 20,bottom: 720,left:20),
        elevation: 5,
        duration: Duration(seconds: 3),
        action: actionTitle != null
            ? SnackBarAction(
                onPressed: onPressed ?? () {},
                label: actionTitle,
                textColor: Colors.yellow,
              )
            : null,
        onVisible: () {
          print('VISIBLE - SNACKBAR');
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        // padding: EdgeInsets.all(15),
      ),
    );
  }
}
