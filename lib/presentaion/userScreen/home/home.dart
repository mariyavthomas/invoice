
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/application/bloc/auth/loginauth_bloc.dart';
import 'package:invoice/utils/color/color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
    backgroundColor: CustomColor.pink(),
    actions: [
      IconButton(onPressed: (){
        context.read<LoginauthBloc>().add(SignOutEvent());
         Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }, icon: Icon(Icons.logout))
    ],
   ),
      body: Center(
        child: Container(
          height: 50,
          width: 100,
        decoration: BoxDecoration(color: Colors.amber),
        ),
      ),
    );
  }
}