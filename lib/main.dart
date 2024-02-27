import 'package:flutter/material.dart';
import 'package:rental_app/src/view/authentication/login_screen.dart';
import 'package:rental_app/src/view/authentication/signup_screen.dart';
import 'package:rental_app/src/view/main_screen.dart';
import 'package:rental_app/src/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/login' : (context) => const LoginScreen(),
        '/signup' : (context) => const SignUpScreen(),
        '/home' : (context) => const MainScreen(),
      },
    ),
  );
}
