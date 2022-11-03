// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class PasswordTextField extends StatefulWidget {
//   final String title;
//   var formKey;
//
//   Widget myicon;
//
//   PasswordTextField({
//     Key? key,
//     required this.title,
//     required this.myicon,
//     required this.formKey,
//   }) : super(key: key);
//
//   @override
//   State<PasswordTextField> createState() => _PasswordTextFieldState();
// }
//
// class _PasswordTextFieldState extends State<PasswordTextField> {
//   bool isShown = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: isShown,
//       decoration: InputDecoration(
//         suffixIcon: Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: Container(
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   isShown = !isShown;
//                 });
//               },
//                 child: widget.myicon),
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         hintText: widget.title,
//         hintStyle: GoogleFonts.urbanist(
//           fontSize: 15.sp,
//           fontWeight: FontWeight.w500,
//           color: const Color(0xff8391A1),
//         ),
//       ),
//       validator: (value) {
//         if(value!.isEmpty && (value.length >= 8 && value.length <= 16)) {
//           return 'password must be 8 to 16 character';
//         }
//         return null;
//       },
//     );
//   }
// }
