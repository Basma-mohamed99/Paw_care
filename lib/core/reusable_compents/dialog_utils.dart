import 'package:flutter/material.dart';

class DialogUtils {
  static lodingDialog(BuildContext context) {

    showDialog(context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: Column(mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
            ],
          ),

        ));
  }
  static exceptionDiloge(BuildContext context,String message){
    showDialog(context: context,
        builder: (context) => AlertDialog(
          content: Column(mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
            ],
          ),

        ));
  }
}