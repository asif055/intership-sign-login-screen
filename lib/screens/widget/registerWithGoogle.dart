import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterWithGoogle extends StatelessWidget {
  Widget myIcon;

  RegisterWithGoogle({
    Key? key,
    required this.myIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        const snackbar = SnackBar(
          content: Text('Register with Google !'),
          // action: SnackBarAction(
          //   label: 'Undo',
          //   onPressed: () {},
          // ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      child: Container(
        height: 56.h,
        width: 105.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color(0xffE8ECF4),
          ),
        ),
        child: Center(child: myIcon),
      ),
    );
  }
}
