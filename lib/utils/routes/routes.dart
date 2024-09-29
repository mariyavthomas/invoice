// ignore_for_file: equal_keys_in_map

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:invoice/presentaion/splash/screen/splash.dart';
import 'package:invoice/presentaion/userScreen/bottannav/bottam.dart';
import 'package:invoice/presentaion/userScreen/login/screen.dart/login.dart';
import 'package:invoice/presentaion/userScreen/signup/screen/firstscreen.dart';
import 'package:invoice/presentaion/userScreen/signup/screen/signup.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController phoneController = TextEditingController();

class Routers {
  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashPage(),
    '/first': (context) => const FirstScreen(),
   // '/sign': (context) => const SignScreen(),
    '/signScreen': (context) => const SignupScreen(),
    '/login': (context) => const LoginScreen(),
    '/mybottom': (context) => const MyBottom(),
  };
}
