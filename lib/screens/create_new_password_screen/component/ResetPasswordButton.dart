import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/route_pages.dart';

class ResetPasswordButton extends StatelessWidget {
  final String title;
  var  formKey;

  ResetPasswordButton({
    Key? key,
    required this.title,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(formKey.currentState!.validate()) {
        Navigator.pushNamed(context, RoutesName.passwordChangeScreen);
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
          child: Text(
            title,
            style: GoogleFonts.urbanist(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xffFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
