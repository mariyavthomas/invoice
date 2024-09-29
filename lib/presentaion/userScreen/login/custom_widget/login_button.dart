// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/application/bloc/auth/loginauth_bloc.dart';
import 'package:invoice/presentaion/userScreen/login/custom_widget/login_fields.dart';
import 'package:invoice/utils/color/color.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class LoginButtons {
  static signIn(BuildContext context) {
    return InkResponse(
      onTap: () {
        BlocProvider.of<LoginauthBloc>(context).add(LoginEvent(
            password: passwordController.text.trim(),
            email: emailController.text.trim()));
      },
      child: Container(
        height: 50,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: CustomColor.pink(),
        ),
        child: BlocBuilder<LoginauthBloc, LoginauthState>(
          builder: (context, state) {
            if (state is Authloading) {
              return Center(
                  child: LoadingAnimationWidget.horizontalRotatingDots(
                color: CustomColor.whiteColor(),
                size: 50,
              ));
            } else {
              return Align(
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whiteColor(),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

}