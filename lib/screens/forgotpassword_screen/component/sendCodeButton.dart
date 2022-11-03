import 'package:firstweek/route/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SendCodeButton extends StatelessWidget {
  final String title;
  var formKey;

  SendCodeButton({
    Key? key,
    required this.title,
    required this.formKey,
  }) : super(key: key);

  @override


  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          Navigator.pushNamed(context, RoutesName.otpVerificationScreen);
        }
      },
      child: Container(
        width: 331.w,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xff1E232C),
        ),
        child: Center(
          child: Text(title,
              style: GoogleFonts.urbanist(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xffFFFFFF),
              )),
        ),
      ),
    );
  }
}
