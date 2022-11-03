import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextField extends StatelessWidget {
  final String title;
  var formKey;
  var emailCont;

  EmailTextField({
    Key? key,
    required this.title,
    required this.formKey,
    required this.emailCont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),

        hintText: title,
        hintStyle: GoogleFonts.urbanist(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xff8391A1),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!)) {
          return 'Enter correct email';
        }
          return null;
      },
      onSaved: (input) => emailCont,
    );
  }
}
