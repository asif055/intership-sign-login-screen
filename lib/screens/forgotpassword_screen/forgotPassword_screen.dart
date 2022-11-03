import 'package:firstweek/constants/constants.dart';
import 'package:firstweek/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_number/phone_number.dart';
import '../../route/route_pages.dart';
import 'package:country_picker/country_picker.dart';

import '../otp_verification_screen/otpverification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();

  late String selectedCountryCode = '+92';
  // bool loading = false;
  final auth = FirebaseAuth.instance;

  bool phoneValid = false;

  isPhoneNotValid() async {
    // True if Not Valid
    String phoneNumber = selectedCountryCode + phoneController.text.trim();
    // bool isValid = await PhoneNumberUtil().validate(
    //   // phoneController.text.trim().toString(),
    //   formatted,
    //   regionCode: "+92",
    // );
    bool isValid = await PhoneNumberUtil().validate(phoneNumber);
    debugPrint("IS VALID : $isValid");
    phoneValid = isValid;
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  // Future passwordReset() async {
  //   try {
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(email: passwordController.text.toString());
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return const AlertDialog(
  //             content: Text('Email send successfully'),
  //           );
  //         });
  //   } on FirebaseAuthException catch (e) {
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             content: Text(e.message.toString()),
  //           );
  //         });
  //   }
  // }

  Widget build(BuildContext context) {
    //scaffold
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 22.0.w,
            right: 22.0.w,
          ),
          child: Form(
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
                Text('Forgot Password?',
                    style: GoogleFonts.urbanist(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(height: 10.h),
                Text(
                  'Don\'t worry! It occurs. Please enter the phone\nnumber linked with your account',
                  style: GoogleFonts.urbanist(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8391A1),
                  ),
                ),
                SizedBox(height: 32.h),
                // const EmailTextField(
                //   title: 'Enter your email',
                // ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: SizedBox(
                      width: 85.w,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 14.0.w),
                            child: InkWell(
                              onTap: () {
                                showCountryPicker(
                                    context: context,
                                    onSelect: (Country value) {
                                      setState(() {
                                        selectedCountryCode =
                                            " +${value.phoneCode}";
                                      });
                                    });
                              },
                              child: SvgPicture.asset(
                                  'assets/image/downarrow.svg'),
                            ),
                          ),
                          // SizedBox(width: 4.w,),
                          Text(
                            selectedCountryCode,
                            style: TextStyle(fontSize: 16.sp),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter phone number',
                    hintStyle: GoogleFonts.urbanist(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff8391A1),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 38.h),
                // SendCodeButton(title: 'Send Code', formKey: formKey),
                InkWell(
                  onTap: () async {
                    await isPhoneNotValid();
                    if (!phoneValid) {
                      showSnack(
                        text: "Please Enter Correct Phone Number.",
                        context: context,
                      );
                    }
                    if (formKey.currentState!.validate() && phoneValid) {
                      Navigator.pushNamed(
                          context, RoutesName.otpVerificationScreen);
                      // auth.verifyPhoneNumber(          //for otp code send to number
                      //   phoneNumber:
                      //       selectedCountryCode + phoneController.text.trim(),
                      //   verificationCompleted: (_) {},
                      //   verificationFailed: (e) {
                      //     Utils().toastMessage(e.toString());
                      //   },
                      //   codeSent: (String verificationId, int? token) {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => OtpVerificationScreen(
                      //             verificationId: verificationId),
                      //       ),
                      //     );
                      //   },
                      //   codeAutoRetrievalTimeout: (e) {
                      //     Utils().toastMessage(e.toString());
                      //   },
                      // );
                    }
                  },

                  // {
                  //   passwordReset();
                  // },

                  child: Container(
                    width: 331.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: const Color(0xff1E232C),
                    ),
                    child: Center(
                      child: Text('Send Code',
                          style: GoogleFonts.urbanist(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xffFFFFFF),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 361.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember Password?',
                      style: GoogleFonts.urbanist(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff032426),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.loginScreen);
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                            color: const Color(0xff35C2C1),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
