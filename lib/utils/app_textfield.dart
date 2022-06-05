import 'package:flutter/material.dart';


class app_textfield extends StatelessWidget {
  final String title;
  final bool secure;
  final TextEditingController? controller;
  final double rightpadding;
  final double toppadding;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType textInputType;

  app_textfield({
    required this.title,
    this.secure = false,
    this.rightpadding = 25,
    this.toppadding = 30,
    this.controller,
    this.prefix,
    this.suffix,
    this.textInputType = TextInputType.text
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right:rightpadding,
          top: toppadding),
      child: Container(
        height:62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color:Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0XFF000000).withAlpha(25),
              offset: Offset(0, 10),
              blurRadius: 10,
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20,top: 25,bottom: 20),
          child: TextField(
            maxLines: 1,
            style: TextStyle(
              color: Colors.black,
            ),
            controller: controller,
            obscureText: secure,
            decoration: InputDecoration(
                hintText: title,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'NunitoSans'),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
