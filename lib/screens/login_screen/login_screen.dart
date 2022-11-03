import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstweek/screens/widget/loginWithAppleId.dart';
import 'package:firstweek/screens/widget/loginWithFacebook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../route/route_pages.dart';
import '../../utils/utility.dart';
import '../widget/loginWithGoogle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isShown = true;
  bool loading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 22.0.w,
            right: 22.0.w,
          ),
          child: Stack(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 56.0.h,
                      ),
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          height: 41.h,
                          width: 41.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0.r),
                            border: Border.all(
                              color: const Color(0xffE8ECF4),
                              width: 1.0.w,
                            ),
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.0.h),
                    Text(
                      'Welcome back! Glad\nto see you, Again!',
                      style: GoogleFonts.urbanist(
                        fontStyle: FontStyle.normal,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    //  EmailTextField(
                    //   title: 'Enter your email', formKey: formKey,
                    // ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: 'Enter your email',
                        hintStyle: GoogleFonts.urbanist(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff8391A1),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                .hasMatch(value!)) {
                          return 'Enter correct email';
                        }
                        return null;
                      },
                      onSaved: (input) => _email = input!,
                    ),
                    SizedBox(height: 15.h),
                    // PasswordTextField(
                    //   title: 'Enter your password',
                    //   myicon: SvgPicture.asset('assets/image/password.svg'),
                    //   formKey: formKey,
                    // ),

                    // width: 331.w,
                    // height: 56.h,
                    // color: const Color(0xffE8ECF4),

                    TextFormField(
                      obscureText: isShown,
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isShown = !isShown;
                                  });
                                },
                                child: SvgPicture.asset(
                                    'assets/image/password.svg')),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: 'Enter your password',
                        hintStyle: GoogleFonts.urbanist(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff8391A1),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            !(value.length >= 8 && value.length <= 16)) {
                          return 'password must be 8 to 16 character';
                        }
                        return null;
                      },
                      onSaved: (input) => _password = input!,
                    ),
                    SizedBox(
                      height: 15.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 22.0.r),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, RoutesName.forgotPasswordScreen);
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xff6A707C),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: login,
                      // {
                      //   if (formKey.currentState!.validate()) {
                      //     const snackbar =
                      //         SnackBar(content: Text('Successful login'));
                      //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      //   }
                      //   FirebaseAuth.instance.signInWithEmailAndPassword(
                      //       email: _email, password: _password);
                      //   Navigator.pushNamed(context, RoutesName.welcomeScreen);
                      // },
                      child: Container(
                        width: 331.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0.r),
                          color: const Color(0xff1E232C),
                        ),
                        child: Center(
                          child: loading ? CircularProgressIndicator(color: Colors.white,) : Text(
                            'Login',
                            style: GoogleFonts.urbanist(
                              fontSize: 15.sp,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Visibility(
                      visible: MediaQuery.of(context).viewInsets.bottom == 0
                          ? true
                          : false,
                      child: Positioned(
                        // bottom: 5.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Expanded(
                              // flex: 1,
                              child: Divider(
                                // height: 112.0.h,
                                color: Color(0xffE8ECF4),
                                thickness: 2.0,
                              ),
                            ),
                            SizedBox(
                              width: 22.0.w,
                            ),
                            Text(
                              'Or Login with',
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                color: const Color(0xff6A707C),
                              ),
                            ),
                            SizedBox(
                              width: 22.0.w,
                            ),
                            const Expanded(
                              // flex: 1,
                              child: Divider(
                                // height: 112.0.h,
                                color: Color(0xffE8ECF4),
                                thickness: 2.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Visibility(
                      visible: MediaQuery.of(context).viewInsets.bottom == 0
                          ? true
                          : false,
                      child: Positioned(
                        bottom: 5.0.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LoginWithFacebook(
                              myIcon: SvgPicture.asset(
                                "assets/image/facebook.svg",
                                width: 12.w,
                                height: 24.h,
                              ),
                            ),
                            LoginWithGoogle(
                              myIcon: SvgPicture.asset(
                                "assets/image/google.svg",
                                width: 12.w,
                                height: 24.h,
                              ),
                            ),
                            LoginWithAppleId(
                              myIcon:
                                  SvgPicture.asset("assets/image/apple.svg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 155.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.registerScreen);
                          },
                          child: Text(
                            ' Register Now',
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xff35C2C1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    final formState = formKey.currentState;
    if (formState!.validate()) {
      setState(() {
        loading = true;
      });
      formState!.save();
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password)
          .then((value) {
            setState(() {
              loading = false;
            });
        Navigator.pushNamed(context, RoutesName.homeScreen);
      })
          .onError(
              (error, stackTrace) {
                setState(() {
                  loading = false;
                });
                Utils().toastMessage('Incorrect email or password');
              });
    }
  }
}
