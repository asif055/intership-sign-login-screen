import 'package:firstweek/splashServices/splashServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'component/login_button.dart';
import 'component/register_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final String assetName = 'assets/image/welcomeicon.png';

  final String icon1 = 'assets/image/icon1.svg';

  final String icon2 = 'assets/image/icon2.svg';

   SplashServices splash = SplashServices();

  @override
  void initState(){
    super.initState();
    // splash.isLogin(context);
  }
  //call the islogin method to check if current user already
                              //enter to the app or not
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 30.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SizedBox(height: 448.h),
            Container(
              height: 58.h,
              width: 58.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: const Color(0xff00D8B6),
                border: Border.all(
                  width: 1.5.w,
                  color: const Color(0xff00D8B6),
                ),
              ),
              child: SizedBox(
                height: 52.h,
                width: 52.w,
                child: Stack(
                  children: [
                    Positioned(
                      top: 1.5.h,
                      left: 1.5.w,
                      child: Image.asset(
                        assetName,
                        height: 52.h,
                        width: 52.w,
                      ),
                    ),
                    Positioned(
                      left: 13.6.w,
                      top: 12.7.h,
                      right: 26.w,
                      bottom: 13.h,
                      child: SvgPicture.asset(
                        icon1,
                      ),
                    ),
                    Positioned(
                      left: 20.8.w,
                      top: 12.7.h,
                      right: 11.7.w,
                      bottom: 13.2.h,
                      child: SvgPicture.asset(
                        icon2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Fruzz',
                  style: GoogleFonts.urbanist(
                    fontSize: 22.sp,
                    color: const Color(0xff1E232C),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  'digital',
                  style: GoogleFonts.urbanist(
                    fontSize: 22.sp,
                  ),
                )
              ],
            ),
            SizedBox(height: 50.h),
            const LoginButton(title: 'Login'),
            SizedBox(height: 15.h),
            const RegisterButton(title: 'Register'),
            SizedBox(height: 46.h),
            Text(
              'Continue as a guest',
              style: GoogleFonts.urbanist(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff35C2C1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
