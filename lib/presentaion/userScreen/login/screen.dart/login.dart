// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/application/bloc/auth/loginauth_bloc.dart';
import 'package:invoice/presentaion/userScreen/login/custom_widget/login_button.dart';
import 'package:invoice/presentaion/userScreen/login/custom_widget/login_fields.dart';
import 'package:invoice/utils/color/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
   bool loading = false;
    return BlocBuilder<LoginauthBloc, LoginauthState>(
      builder: (context, state) {
       if(state is LoginauthInitialstate){
        loading =false;
       }
      else if (state is Authloading) {
          loading=true;
          return Center(
            child: CircularProgressIndicator(
              color: CustomColor.pink(),
            ),
          );
        }
        if (state is Authenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/mybottom', (route) => false);
          });
          BlocProvider.of<LoginauthBloc>(context).add(LogingInitialEvent());
        } else if (state is AuthenticatedError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      content: Text(state.message.toString()),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              BlocProvider.of<LoginauthBloc>(context)
                                  .add((LogingInitialEvent()));
                            },
                            child: const Text('ok'))
                      ]);
                });
          });
        }
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 70, 70, 70)),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          LoginFields.emailFields(),
                          SizedBox(
                            height: 17,
                          ),
                          Text(
                            'Password:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 70, 70, 70)),
                          ),
                          SizedBox(
                            height: 17,
                          ),
                          LoginFields.passwordFields(),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        LoginButtons.signIn(context),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const signagain(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
