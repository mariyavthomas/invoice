// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:invoice/application/bloc/auth/loginauth_bloc.dart';
import 'package:invoice/domain/usermodel.dart';
import 'package:invoice/presentaion/userScreen/login/screen.dart/login.dart';
import 'package:invoice/presentaion/userScreen/signup/custom_widget/field.dart';
import 'package:invoice/utils/color/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Buttons {
 
  static Widget signUp(BuildContext context, GlobalKey<FormState> formKey,String image,bool loading) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: InkWell(
        onTap: () {
          if (formKey.currentState!.validate()) {
            UserModel user=UserModel(
              image: image.toString(),
              organizationName: nameController.text,
              password: passwordController.text,
              phone: phoneController.text,
              email: emailController.text
            );
           context.read<LoginauthBloc>().add(SignUpEvent(user: user));
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          }
        },
        child: Container(
          height: 48,
          width: 350,
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
                    'Register',
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
      ),
    );
  }

}