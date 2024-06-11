import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

Future<bool?> showToast({required String msg,Color?color}) async {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor:color?? AppColors.appColor,
      textColor: AppColors.whiteColor,
      fontSize: 16.0
  );
}