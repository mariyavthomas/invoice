import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/application/bloc/image/img_bloc_bloc.dart';
import 'package:invoice/presentaion/userScreen/bottannav/bottam.dart';

//FirebaseAuthentServices class to handle FirebaseAuth operations
class FirebaseAuthentServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
   
  void signIn(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Successfully'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyBottom()), // Replace with your destination widget
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.code == 'user-not-found' || e.code == 'wrong-password'
              ? 'Email and password are incorrect'
              : 'Login error: ${e.message}'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An unexpected error occurred: $e'),
        ),
      );
    }
    
  }
  Future<dynamic> ShowBottoms(BuildContext context) {
    return showModalBottomSheet<dynamic>(
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
        //  Navigator.pop(context);
          return BlocBuilder<ImgBlocBloc, ImgBlocState>(
            builder: (context, state) {
              return ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    onTap: () {
                      context.read<ImgBlocBloc>().add(camerPickerEvent());
                    },
                    leading: Icon(Icons.camera),
                    title: Text('Take Form Camera'),
                  ),
                  ListTile(
                    onTap: () {
                      context.read<ImgBlocBloc>().add(gellaryPickerEvent());
                    },
                    leading: Icon(Icons.browse_gallery),
                    title: Text('Take Form Gellary'),
                  ),
                ],
              );
            },
          );
        });}

}
