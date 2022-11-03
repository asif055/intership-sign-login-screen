import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstweek/route/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterButton2 extends StatelessWidget {
  final String title;
  var formKey;
  var passCont;
  var emailCont;

   RegisterButton2({
    Key? key,
    required this.title,
    required this.formKey,
     required this.passCont,
     required this.emailCont,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(formKey.currentState!.validate()) {
          var snackbar = const SnackBar(
            content: Text('Successfully Registered'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }

        FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailCont, password: passCont);
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
            title,
            style: GoogleFonts.urbanist(
              fontSize: 15,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              color: const Color(0xffFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
