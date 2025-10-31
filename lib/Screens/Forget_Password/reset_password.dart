import 'package:auth_practice_firebase_2/Screens/Login/login.dart';
import 'package:auth_practice_firebase_2/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/submitted.png"),
              width: 217.w,
              height: 187.h,
            ),
            Gap(73.h),
            Text(
              "Email sent to change your password",
              style: GoogleFonts.roboto(
                color: ColorsManager.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Gap(50.h),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => Login()),
                );
              },
              child: Text(
                "Back to Login",
                style: GoogleFonts.roboto(
                  color: ColorsManager.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.primary,
                fixedSize: Size(362.w, 49.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
