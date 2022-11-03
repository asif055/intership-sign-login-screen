import 'package:firstweek/screens/password_changedScreen/component/back_to_login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 110.h,
                width: 110.w,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 110.h,
                      width: 110.w,
                      child: SvgPicture.asset(
                        "assets/image/passwordChangedDone.svg",
                      ),
                    ),
                    Center(
                      child: SvgPicture.asset(
                        "assets/image/done.svg",
                      ),
                    ),
                    // Positioned(
                    //   top: 32,
                    //   left: 32,
                    //   child: SvgPicture.asset(
                    //     "assets/image/done.svg",
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                'Password Changed!',
                style: GoogleFonts.urbanist(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Your password have been changed\nsuccessfuly.',
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff8391A1),
                ),
              ),
              SizedBox(height: 36.h),
              const BackToLoginButton(title: 'Back to Login')
            ],
          ),
        ),
      ),
    );
  }
}
