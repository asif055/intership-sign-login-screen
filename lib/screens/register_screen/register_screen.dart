import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../route/route_pages.dart';
import '../../utils/utility.dart';
import '../create_new_password_screen/component/passwordField.dart';
import '../widget/registerWithAppleId.dart';
import '../widget/registerWithFacebook.dart';
import '../widget/registerWithGoogle.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  late String _email;
  late String _password;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 22.0.w,
            right: 22.0.w,
          ),
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
              // Form(key: formKey, child: Column(children: [textFi cont validator],),),
              Text(
                'Hello! register to get\nstarted',
                style: GoogleFonts.urbanist(
                  fontStyle: FontStyle.normal,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 32.h),
              //  EmailTextField(
              //   title: 'Username',
              // ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: 'Username',
                        hintStyle: GoogleFonts.urbanist(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff8391A1),
                        ),
                      ),
                      // validator: (value) {
                      //   if (value!.isEmpty &&
                      //       !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
                      //     return 'Enter correct name';
                      //   }
                      //   return null;
                      // },
                      // onSaved: (input) => usernameCont,
                    ),
                    SizedBox(height: 12.h),
                    // EmailTextField(
                    //   title: 'Email',
                    //   formKey: formKey,
                    //   emailCont: emailCont,
                    // ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: 'Email',
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
                    SizedBox(height: 12.h),
                    // PasswordField(
                    //   title: 'Password',
                    //   formKey: formKey,
                    //   passCont: passCont,
                    // ),
                    TextFormField(
                      decoration: InputDecoration(
                         border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.urbanist(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff8391A1),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter password';
                        }
                        return null;
                      },
                      onSaved: (input) => _password = input!,
                    ),
                    SizedBox(height: 12.h),
                    PasswordField(
                      title: 'Confirm password',
                      formKey: formKey,
                    ),
                    SizedBox(height: 30.0.h),
                    // RegisterButton2(
                    //   title: 'Register',
                    //   formKey: formKey,
                    //   passCont: passCont,
                    //   emailCont: emailCont,
                    // ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          loading = true;
                        });
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password)

                              .then((value) => Navigator.pushNamed(
                                  context, RoutesName.homeScreen))

                              .onError(
                                (error, stackTrace) =>
                                    Utils().toastMessage(error.toString()),
                              );
                        }
                      },
                      child: Container(
                        width: 331.w,
                        height: 56.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            width: 1.5,
                          ),
                          color: const Color(0xff1E232C),
                        ),
                        child: Center(
                          child: Text(
                            'Register',
                            style: GoogleFonts.urbanist(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 35.h,
              ),
              Visibility(
                visible: MediaQuery.of(context).viewInsets.bottom == 0
                    ? true
                    : false,
                child: Positioned(
                  bottom: 5.0.h,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                        // flex: 1,
                        child: Divider(
                          // height: 112.0,
                          color: Color(0xffE8ECF4),
                          thickness: 2.0,
                        ),
                      ),
                      SizedBox(
                        width: 22.0.w,
                      ),
                      Text(
                        'Or Register with',
                        style: GoogleFonts.urbanist(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xff6A707C),
                        ),
                      ),
                      SizedBox(
                        width: 22.0.w,
                      ),
                      const Expanded(
                        // flex: 1,
                        child: Divider(
                          // height: 112.0,
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
                    children: [
                      RegisterWithFacebook(
                          myIcon: SvgPicture.asset(
                        "assets/image/facebook.svg",
                        width: 12.w,
                        height: 24.h,
                      )),
                      RegisterWithGoogle(
                        myIcon: SvgPicture.asset(
                          "assets/image/google.svg",
                          width: 12.w,
                          height: 24.h,
                        ),
                      ),
                      RegisterWithAppleId(
                        myIcon: SvgPicture.asset("assets/image/apple.svg"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 54.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.urbanist(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff1E232C),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // nextPage(context: context, page: RoutesName.loginScreen);
                      Navigator.pushNamed(context, RoutesName.loginScreen);
                    },
                    child: Text(
                      ' Login Now',
                      style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff35C2C1),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
