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
    final screenHeight = MediaQuery.of(context).size.height;
    const appLogoPath = 'assets/images/logo.png';
    const banoQabilLogoPath = 'assets/images/bano_qabil_logo.png';

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              appLogoPath,
              fit: BoxFit.fill,
              width: screenWidth * 0.560,
            ),
            SizedBox(height: screenHeight * 0.240),
            const Text(
              'from',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.005),
            Image.asset(
              banoQabilLogoPath,
              fit: BoxFit.fill,
              width: screenWidth * 0.230,
            ),
            SizedBox(height: screenHeight * 0.040),
          ],
        ),
      ),
    );
  }
}
