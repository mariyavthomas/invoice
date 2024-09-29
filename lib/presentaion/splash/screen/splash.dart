import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/application/bloc/auth/loginauth_bloc.dart';
import 'package:invoice/presentaion/userScreen/login/screen.dart/login.dart';


import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginauthBloc, LoginauthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/mybottom', (route) => false);
            } else if (state is UnAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child:
                    Lottie.asset('asset/image/Animation - 1727588804304.json', height: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}