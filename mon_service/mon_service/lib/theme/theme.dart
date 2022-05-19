import 'package:flutter/material.dart';

class theme {
  static Color mainColor = Color(0xff8D7FBA);
  static Color appBackgroundColor = Color(0xffffffff);
  static Color blueColor = const Color(0xff0063ae);
  static Color textFieldColor = Colors.grey.shade200;
  static Color redColor = const Color(0xffaa0c1f);
  static Color lightTextColor = Color(0xff929292);
  static Color darkTextColor = Color(0xff707070);
  static Color whiteColor = Color(0xffffffff);

  static List<BoxShadow> boxShadow = [
    BoxShadow(
        blurRadius: 5,
        spreadRadius: 1,
        color: Colors.grey.shade300,
        offset: Offset(1, 1)),
    BoxShadow(
        blurRadius: 4,
        spreadRadius: 1,
        color: Colors.white.withOpacity(.8),
        offset: Offset(-1, -1)),
  ];
}
