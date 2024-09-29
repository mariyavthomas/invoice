
import 'package:flutter/material.dart';
import 'package:invoice/presentaion/userScreen/login/screen.dart/login.dart';
import 'package:invoice/presentaion/userScreen/signup/screen/signup.dart';
import 'package:invoice/utils/color/color.dart';
import 'package:invoice/utils/image/imageloader.dart';
import 'package:page_transition/page_transition.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteColor(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: CustomImageLoader.loadWelcomeImage(),
              ),
              Title(
                  color: CustomColor.pink(),
                  child: const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 30),
                  )),
              Text("Have a better sharing experience",
                  style: TextStyle(
                    color: CustomColor.greyColor(),
                  )),
              const SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType
                              .rightToLeft,
                          child:
                              SignupScreen(), 
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      // ignore: deprecated_member_use
                      backgroundColor: CustomColor.pink(),
                    ),
                    child: Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whiteColor(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SizedBox(
                  height: 50,
                  width: 250,
                  child: OutlinedButton(
                    onPressed: () {
                       Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType
                              .leftToRight,
                          child:
                              const LoginScreen(), 
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: CustomColor.pink(), // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.pink(), // Text color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 120,
                child: Divider(
                  thickness: 5,
                  color: CustomColor.blackColor(),
                ),
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}