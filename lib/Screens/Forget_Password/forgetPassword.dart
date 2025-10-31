import 'package:auth_practice_firebase_2/Screens/Forget_Password/reset_password.dart';
import 'package:auth_practice_firebase_2/Screens/Login/login.dart';
import 'package:auth_practice_firebase_2/resources/colors_manager.dart';
import 'package:auth_practice_firebase_2/widgets/custom_text_form_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorsManager.surface,
      body: Center(
        child: Padding(
          padding: REdgeInsets.only(top: 160.h, left: 34.w, right: 34.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forgot Password",
                style: GoogleFonts.roboto(
                  color: ColorsManager.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(31.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: GoogleFonts.roboto(
                      color: ColorsManager.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(11.h),
                  CustomTextFormFeild(hintText: "Enter your Email",controller: _emailController,),
                ],
              ),
              Gap(28.h),
              ElevatedButton(
                onPressed: () {
                  _resetPassword(_emailController.text, context);

                },
                child: Text(
                  "Submit",
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
              Gap(28.h),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => Login()),
                  );
                },
                child: Text(
                  "Back",
                  style: GoogleFonts.roboto(
                    color: ColorsManager.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _resetPassword(String email,BuildContext context) async{
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email:email);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم إرسال رابط إعادة التعيين إلى بريدك الإلكتروني')),
        );
      }catch(e){}
  }
}
