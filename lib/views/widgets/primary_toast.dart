import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PrimaryToast {

  displayToast(String message,Color backgroundColor){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 6,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
    );
  }
}