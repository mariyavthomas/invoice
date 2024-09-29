// ignore_for_file: unused_element, use_super_parameters, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/application/bloc/auth/loginauth_bloc.dart';
import 'package:invoice/utils/color/color.dart';
import 'package:invoice/utils/textformfiled/customtextformfiled.dart';
import 'package:invoice/utils/validator/validator.dart';


final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
@override
void dispose() {
  emailController.dispose();
  passwordController.dispose();
}

bool obtext = true;

class LoginFields {
  static Widget emailFields() {
    return CustomTextFormField(
      // Custom text form field
      controller: emailController,
      labelText: 'Email',
      hintText: 'Enter your email or phone',
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validator().emailValidator(value),
    );
  }

  static Widget passwordFields() {
    return BlocBuilder<LoginauthBloc, LoginauthState>(
      builder: (context, state) {
        if (state is ObsecureState) {
          obtext = state.obscure;
        }
        return CustomTextFormField(
          obscureText: obtext,
          controller: passwordController,
          labelText: 'password',
          hintText: 'Enter your password',
          suffixIcon: obtext
              ? IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {
                    BlocProvider.of<LoginauthBloc>(context)
                        .add(ObsecuretextEvent(obscure: obtext));
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.visibility),
                  onPressed: () {
                    BlocProvider.of<LoginauthBloc>(context)
                        .add(ObsecuretextEvent(obscure: obtext));
                  },
                ),
          keyboardType: TextInputType.visiblePassword,
          validator: (value) => Validator().nameValidator(value),
        );
      },
    );
  }
}

class signagain extends StatelessWidget {
  const signagain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't hanve an account?  "),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/signScreen');
          },
          child: Text(
            'Register',
            style: TextStyle(
                color: CustomColor.blackColor(),fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}

class forgot extends StatelessWidget {
  const forgot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/forgotScreen');
            },
            child: Text(
              'Forgot password?',
              style: TextStyle(
                  color: CustomColor.redColor(),
                  decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }
}