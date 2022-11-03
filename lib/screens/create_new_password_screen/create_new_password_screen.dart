import 'package:firstweek/screens/create_new_password_screen/component/ResetPasswordButton.dart';
import 'package:firstweek/screens/create_new_password_screen/component/passwordField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                SizedBox(
                  height: 28.0.h,
                ),
                Text(
                  'Create new password',
                  style: GoogleFonts.urbanist(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  'Your new password must be unique from those\npreviously used',
                  style: GoogleFonts.urbanist(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff8391A1),
                  ),
                ),
                SizedBox(height: 32.0.h),
                 PasswordField(title: 'New Password', formKey: formKey),
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //     hintText: 'New Password',
                //     hintStyle: GoogleFonts.urbanist(
                //       fontSize: 15.sp,
                //       fontWeight: FontWeight.w500,
                //       color: const Color(0xff8391A1),
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty ||
                //         !(value.length >= 8 && value.length <= 16)) {
                //       return 'password must be 8 to 16 character';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: 15.0.h,
                ),
                 PasswordField(title: 'Confirm Password', formKey: formKey,),
                // TextFormField(
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(8.0),
                //     ),
                //     hintText: 'Confirm Password',
                //     hintStyle: GoogleFonts.urbanist(
                //       fontSize: 15.sp,
                //       fontWeight: FontWeight.w500,
                //       color: const Color(0xff8391A1),
                //     ),
                //   ),
                //   validator: (value) {
                //     if (value!.isEmpty ||
                //         !(value.length >= 8 && value.length <= 16)) {
                //       return 'password must be 8 to 16 character';
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: 38.0.h,
                ),
                ResetPasswordButton(title: 'Reset password', formKey: formKey,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
