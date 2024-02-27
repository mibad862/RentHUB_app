import 'package:flutter/material.dart';
import 'package:rental_app/src/view/authentication/login_screen.dart';
import 'package:rental_app/src/view/authentication/signup_screen.dart';
import 'package:rental_app/src/view/home_screen.dart';
import 'package:rental_app/src/view/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        '/login' : (context) => const LoginScreen(),
        '/signup' : (context) => const SignUpScreen(),
        '/home' : (context) => const HomeScreen(),
      },
    ),
  );
}
