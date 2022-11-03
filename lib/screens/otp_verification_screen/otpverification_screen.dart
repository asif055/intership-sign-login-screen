import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'component/verifyButton.dart';

class OtpVerificationScreen extends StatefulWidget {
  // final String verificationId;

  const OtpVerificationScreen({
    Key? key,
    // required this.verificationId,
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 22.w,
            right: 22.w,
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
                      borderRadius: BorderRadius.circular(
                        12.0.r,
                      ),
                      border: Border.all(
                        color: const Color(0xffE8ECF4),
                        width: 1.0,
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
                'OTP Verification',
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.sp,
                  color: const Color(0xff1E232C),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Enter the verification code we just send on your phone number.',
                style: GoogleFonts.urbanist(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff838BA1),
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      width: 45.w,
                      height: 60.h,
                      textStyle: GoogleFonts.urbanist(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(30, 60, 87, 1),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff35C2C1),
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 45.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       width: 70.w,
              //       height: 60.h,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8.0.r),
              //         border: Border.all(
              //           color: const Color(0xff35C2C1),
              //           width: 1.0.w,
              //         ),
              //       ),
              //       child: Center(
              //         child: Text(
              //           '5',
              //           style: GoogleFonts.urbanist(
              //             fontSize: 22.sp,
              //             fontWeight: FontWeight.w700,
              //             color: const Color(0xff1E232C),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       width: 70.w,
              //       height: 60.h,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8.0.r),
              //         border: Border.all(
              //           color: const Color(0xff35C2C1),
              //           width: 1.0.w,
              //         ),
              //       ),
              //       child: Center(
              //         child: Text(
              //           '1',
              //           style: GoogleFonts.urbanist(
              //             fontSize: 22.sp,
              //             fontWeight: FontWeight.w700,
              //             color: const Color(0xff1E232C),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       width: 70.w,
              //       height: 60.h,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(
              //           8.0.r,
              //         ),
              //         border: Border.all(
              //           color: const Color(0xff35C2C1),
              //           width: 1.0.w,
              //         ),
              //       ),
              //       child: Center(
              //         child: Text(
              //           '3',
              //           style: GoogleFonts.urbanist(
              //             fontSize: 22.sp,
              //             fontWeight: FontWeight.w700,
              //             color: const Color(0xff1E232C),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Container(
              //       width: 70.w,
              //       height: 60.h,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8.r),
              //         color: const Color(0xffE8ECF4),
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(height: 38.h),
              const VerifyButton(title: 'Verify'),
              SizedBox(height: 357.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t received code?',
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: const Color(0xff1E232C),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      ' Resend',
                      style: GoogleFonts.urbanist(
                          color: const Color(0xff35C2C1),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
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
