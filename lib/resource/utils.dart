import 'package:bloc_api/resource/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message, Color color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: white,
        fontSize: 16.0);
  }

  static String stringAsExponential(String item) {
    RegExp numberRegExp = RegExp(r'^[-+]?[0-9]+\.[0-9]+$');
    if (numberRegExp.hasMatch(item)) {
      double someDouble = double.parse(item);
      String a = someDouble.toStringAsFixed(1);
      return a;
    } else {
      return "0.0";
    }
  }
}
