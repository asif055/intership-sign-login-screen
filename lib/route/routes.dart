import 'package:firstweek/homeScreen.dart';
import 'package:firstweek/route/route_pages.dart';
import 'package:firstweek/screens/create_new_password_screen/create_new_password_screen.dart';
import 'package:firstweek/screens/forgotpassword_screen/forgotPassword_screen.dart';
import 'package:firstweek/screens/otp_verification_screen/otpverification_screen.dart';
import 'package:firstweek/screens/password_changedScreen/password_changed_screen.dart';
import 'package:firstweek/screens/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen/login_screen.dart';
import '../screens/welcomescreen/welcome_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.welcomeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const WelcomeScreen());
      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.registerScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) =>  RegisterScreen());
      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ForgotPasswordScreen());
      case RoutesName.otpVerificationScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OtpVerificationScreen());
      case RoutesName.createNewPasswordScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const CreateNewPasswordScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RoutesName.passwordChangeScreen:
        return MaterialPageRoute(
            builder: (BuildContext context) => const PasswordChangedScreen());

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route Found'),
              ),
            );
          },
        );
    }
  }
}
