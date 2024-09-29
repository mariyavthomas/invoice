import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/application/bloc/auth/loginauth_bloc.dart';
import 'package:invoice/application/bloc/bottam/bottom_navigation_bar_bloc.dart';
import 'package:invoice/application/bloc/image/img_bloc_bloc.dart';
import 'package:invoice/firebase_options.dart';
import 'package:invoice/infrastructure/imagerepo.dart';
import 'package:invoice/utils/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final FirestoreService firestoreService = FirestoreService();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider<LoginauthBloc>(create: (context)=>LoginauthBloc()),
        BlocProvider(
          create: (context) => BottomNavigationBarBloc(),
        ),
        BlocProvider(create: (context) => ImgBlocBloc(ImagePickerServices()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: Routers().routes,
      ),
    );
  }
}
