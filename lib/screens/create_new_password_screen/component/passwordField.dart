import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatelessWidget {
  final String title;
   var formKey;
   // var passCont;


   PasswordField({
    Key? key,
    required this.title,
    required this.formKey,
     // required this.passCont,
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
      // validator: (value) {
      //   if(value!.isEmpty || !(value.length >= 8 && value.length <= 16)){
      //     return 'password must be 8 to 16 character';
      //   }
      //   return null;
      // },
      // onSaved: (input) => passCont,
    );
  }
}
