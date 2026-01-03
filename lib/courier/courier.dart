import 'package:flutter/material.dart';

class Courier {
  static void sendTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}
