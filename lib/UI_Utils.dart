import 'package:auth_practice_firebase_2/resources/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UiUtils {
  static void showLoading(BuildContext context, {bool isDismissible = false}) {
    showDialog(
      barrierDismissible: isDismissible,
      barrierColor: Colors.black54,
      context: context,
      builder: (context) => PopScope(
        canPop: isDismissible,
        child: Dialog(
          backgroundColor: ColorsManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            width: 100.w,
            height: 150.h,
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitSquareCircle(
                  color: ColorsManager.surface, // الـ loader لون surface
                  size: 40.w,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  static void hideLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}