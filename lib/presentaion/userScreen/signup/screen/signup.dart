// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:invoice/application/bloc/auth/loginauth_bloc.dart';
import 'package:invoice/application/bloc/image/img_bloc_bloc.dart';
import 'package:invoice/infrastructure/authrepo.dart';
import 'package:invoice/presentaion/userScreen/signup/custom_widget/button.dart';
import 'package:invoice/presentaion/userScreen/signup/custom_widget/field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key, Key? Key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginauthBloc, LoginauthState>(
      builder: (context, state) {
        if(state is LoginauthInitialstate){
          loading =false;
        }
        else if(state is Authloading){
          loading =true;
          
        }
        else if(state is AuthenticatedError){
            WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(state.message),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        BlocProvider.of<LoginauthBloc>(context)
                            .add(LogingInitialEvent());
                      },
                      child: Text('ok'))
                ],
              );
            },
          );
        });
        }
        else if(state is Authenticated){
           WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Successfully Registered'),
            backgroundColor: Colors.green,
          ));
        });
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
       
         
        });
        }
        return Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Form(
                key: formKey,
                child: BlocBuilder<ImgBlocBloc, ImgBlocState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  FirebaseAuthentServices()
                                      .ShowBottoms(context);
                                },
                                child: Column(children: [
                                  CircleAvatar(
                                    backgroundColor: const Color.fromARGB(
                                        255, 216, 214, 214),
                                    maxRadius:
                                        MediaQuery.of(context).size.width *
                                            0.22,
                                    backgroundImage: state.file != null
                                        ? FileImage(
                                            File(state.file![0].path),
                                          )
                                        : null,
                                    child: state.file == null
                                        ? Icon(
                                            Icons.camera_alt_outlined,
                                            color: Colors.grey,
                                            size: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.30,
                                          )
                                        : null,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    height: 45,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 57, 57, 57)),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                        child: Text(
                                      "Add a logo",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 103, 102, 102),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    )),
                                  )
                                ])),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Organization :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Fields.nameFields()),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Phone :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Fields.phonefields(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Password :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Fields.passwordfields(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Email :',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Fields.emailFields(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Buttons.signUp(context, formKey, state.file.toString(),loading),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?'),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 79, 78, 78)),
                                ))
                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ));
      },
    );
  }
}
