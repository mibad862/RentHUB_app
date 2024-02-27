import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacementNamed(context, '/login'),
    );
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    const assetPath = 'assets/images/logo.png';

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Image.asset(
          assetPath,
          fit: BoxFit.fill,
          width: screenWidth * 0.6,
        ),
      ),
    );
  }
}
