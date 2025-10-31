import 'package:auth_practice_firebase_2/Screens/Forget_Password/forgetPassword.dart';
import 'package:auth_practice_firebase_2/Screens/Login/login.dart';
import 'package:auth_practice_firebase_2/Screens/Sign_Up/signup.dart';
import 'package:auth_practice_firebase_2/Screens/Submit/submit.dart';
import 'package:auth_practice_firebase_2/UI_Utils.dart';
import 'package:auth_practice_firebase_2/providers/text_provider.dart';
import 'package:auth_practice_firebase_2/resources/colors_manager.dart';
import 'package:auth_practice_firebase_2/widgets/custom_text_form_feild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../resources/validators.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>  {
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
          padding: REdgeInsets.only(top: 160.h, left: 34.w, right: 34.w),
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
                        "LOGIN",
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
                          Gap(10.h),
                          TextButton(
                            onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (c) => Forgetpassword()));},
                            child: Text(
                              "Forgot Password?",
                              style: GoogleFonts.roboto(
                                color: ColorsManager.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(28.h),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Provider.of<TextProvider>(context, listen: false).updateMailText(_emailController.text);
                            _logIn();
                          }
                        },
                        child: Text(
                          "LOGIN",
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
                            "No Account?",
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
                                MaterialPageRoute(builder: (c) => Signup()),
                              );
                            },
                            child: Text(
                              "Register",
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

  void _logIn() async {

    if (_formKey.currentState?.validate() == false) return;

    try {
        UiUtils.showLoading(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // فقط في حالة النجاح ننتقل للصفحة التالية
      if (credential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Logged-in Successfully"),
        ));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (c) => Submit()),
        );
      }

    } on FirebaseAuthException catch (e) {
        UiUtils.hideLoading(context);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: ColorsManager.danger,
                content: Text('No user found for that email.')
            )
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: ColorsManager.danger,
                content: Text('Wrong password')
            )
        );
      } else {
        // معالجة أي أخطاء أخرى
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: ColorsManager.danger,
                content: Text('Login failed: ${e.message}')
            )
        );
      }
    } catch (e) {

      // معالجة أي أخطاء عامة
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: ColorsManager.danger,
              content: Text('An error occurred: $e')
          )
      );
      print('An error occurred: $e');
    }
  }
}
