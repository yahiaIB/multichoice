import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperFunctions {
  static toast({@required text, Color backgroundColor = Colors.green}) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static isValidResponse(response) {
    if (response.data["responseCode"] == 2) {
      if (response.data["dateSet"] != null) {
        throw response.data["dateSet"].toString();
      }
      throw response.data["responseMessage"];
    } else if (response.data["responseCode"] == 1) {
      if (response.data["responseMessage"] != null && response.data["responseMessage"].length  > 0) {
        toast(text: response.data["responseMessage"]);
      }
    }
    return;
  }
}
