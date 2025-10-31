import 'package:auth_practice_firebase_2/Screens/Login/login.dart';
import 'package:auth_practice_firebase_2/providers/text_provider.dart';
import 'package:auth_practice_firebase_2/resources/colors_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Sign_Up/signup.dart';

class Submit extends StatelessWidget {
  const Submit({super.key});

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<TextProvider>(context).name;
    final mail = Provider.of<TextProvider>(context).mail;
    return Scaffold(
      backgroundColor: ColorsManager.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: 362,
                  height: 219,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: ColorsManager.primary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 26.h),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/profile.png",
                        width: 91.w,
                        height: 91.h,
                      ),
                      Gap(17.h),
                      Text(
                        name,
                        style: GoogleFonts.roboto(
                          color: ColorsManager.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        mail,
                        style: GoogleFonts.roboto(
                          color: ColorsManager.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Gap(7.h),
                      Text(
                        "+639717433317",
                        style: GoogleFonts.roboto(
                          color: ColorsManager.grey,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(29.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => Login()),
                    );
                  },
                  child: Text(
                    "Edit",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    side: BorderSide(color: ColorsManager.primary, width: 2),
                    fixedSize: Size(174.w, 50.h),
                  ),
                ),
                OutlinedButton(
                  onPressed: ()  {
                    _logout(context);
                  },
                  child: Text(
                    "Logout",
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    side: BorderSide(color: ColorsManager.danger, width: 2),
                    fixedSize: Size(174.w, 50.h),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void _logout (BuildContext context) async{
    await FirebaseAuth.instance.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (c) => Signup()),
    );

  }
}
