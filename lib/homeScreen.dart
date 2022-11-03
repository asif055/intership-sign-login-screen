import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstweek/screens/login_screen/login_screen.dart';
import 'package:firstweek/screens/welcomescreen/welcome_screen.dart';
import 'package:firstweek/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          actions: [
            Padding(
              padding: EdgeInsets.all(12.0.w.h),
              child: InkWell(onTap: logout, child: Icon(Icons.logout)),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
               Text('Welcome to HomeScreen'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())))
        .onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }
}
