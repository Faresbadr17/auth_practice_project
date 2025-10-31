import 'package:auth_practice_firebase_2/Screens/Login/login.dart';
import 'package:auth_practice_firebase_2/UI_Utils.dart';
import 'package:auth_practice_firebase_2/resources/colors_manager.dart';
import 'package:auth_practice_firebase_2/widgets/custom_text_form_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/text_provider.dart';
import '../../resources/validators.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool securePassword = true;
  bool secureConfirmPassword = true;

  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  final _nameController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.surface,
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.only(
            bottom: 0,
            left: 34.w,
            right: 34.w,
            top: 0.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "THIRDY BIZ",
                        style: GoogleFonts.roboto(
                          color: ColorsManager.white,
                          fontSize: 41,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Digital Calling Card",
                        style: GoogleFonts.roboto(
                          color: ColorsManager.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Gap(26.h),
                      Container(
                        width: 357,
                        height: 1,
                        color: ColorsManager.white,
                      ),
                      Gap(34.h),
                      Text(
                        "GET STARTED",
                        style: GoogleFonts.roboto(
                          color: ColorsManager.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(28),
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
                          CustomTextFormFeild(
                            validator: Validator.validateEmail,
                            hintText: "Enter your Email",
                            controller: _emailController,
                          ),
                        ],
                      ),
                      Gap(26.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: GoogleFonts.roboto(
                              color: ColorsManager.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(11.h),
                          CustomTextFormFeild(
                            validator: Validator.validateName,
                            hintText: "Enter your Name",
                            controller: _nameController,
                          ),
                        ],
                      ),
                      Gap(26.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: GoogleFonts.roboto(
                              color: ColorsManager.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(11.h),
                          CustomTextFormFeild(
                            validator: Validator.validatePassword,
                            isObscure: securePassword ? true : false,
                            hintText: "Enter your Password",
                            controller: _passwordController,
                            suffixIcon: IconButton(
                              onPressed: _onTogglePasswordIconClicked,
                              icon: Icon(
                                securePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorsManager.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(26.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Confirm Password",
                            style: GoogleFonts.roboto(
                              color: ColorsManager.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Gap(11.h),
                          CustomTextFormFeild(
                            validator: (input) {
                              if (input == null || input.trim().isEmpty) {
                                return "Plz, confirm password";
                              }
                              if (input != _passwordController.text) {
                                return "Password doesn't match";
                              }
                              return null;
                            },
                            hintText: "Match  your Password",
                            controller: _confirmPasswordController,
                            suffixIcon: IconButton(
                              onPressed: _onToggleConfirmPasswordIconClicked,
                              icon: Icon(
                                secureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: ColorsManager.grey,
                              ),
                            ),
                            isObscure: secureConfirmPassword ? true : false,
                          ),
                        ],
                      ),
                      Gap(36.h),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<TextProvider>(
                            context,
                            listen: false,
                          ).updateNameText(_nameController.text);
                          _createAccount();
                        },
                        child: Text(
                          "REGISTER",
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
                      Gap(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Account?",
                            style: GoogleFonts.roboto(
                              color: ColorsManager.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Gap(0.w),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (c) => Login()),
                              );
                            },
                            child: Text(
                              "Login",
                              style: GoogleFonts.roboto(
                                color: ColorsManager.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTogglePasswordIconClicked() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _onToggleConfirmPasswordIconClicked() {
    setState(() {
      secureConfirmPassword = !secureConfirmPassword;
    });
  }

  void _createAccount() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      UiUtils.showLoading(context);
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
      if (credential.user != null){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Account created Successfully"),
        ));
      }
    } on FirebaseAuthException catch (e) {
      UiUtils.hideLoading(context);
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorsManager.danger,
          content: Text(" Sign-up failed : ${e.code}"),
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: ColorsManager.danger,
          content: Text(" Sign-up failed : ${e.code}"),
        ));
      }
    }
      Navigator.push(context, MaterialPageRoute(builder: (c) => Login()));

  }
}
