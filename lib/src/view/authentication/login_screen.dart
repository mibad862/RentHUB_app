import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/src/view/authentication/validator.dart';
import 'package:rental_app/src/widgets/common_bottom_headline.dart';
import 'package:rental_app/src/widgets/common_pass_textfield.dart';
import 'package:rental_app/src/widgets/common_button.dart';
import 'package:rental_app/src/utils/colors.dart';
import 'package:rental_app/src/widgets/common_email_textfield.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isVisible = false;
  bool isSubmit = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> _submit() async {
    setState(() {
      isSubmit = true; // Set to true to show loading indicator
    });

    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      setState(() {
        isSubmit = false; // Reset to false if validation fails
      });
      return;
    }
    _formKey.currentState!.save();

    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    } on FirebaseAuthException catch (error) {
      // Handle different authentication errors
      String errorMessage = error.code.toString();

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    } finally {
      setState(() {
        isSubmit = false; // Reset to false after authentication attempt
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.020),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.150),
                    child: const Text(
                      'Welcome back',
                      style: TextStyle(fontSize: 30.0, color: AppColors.darkBlue),
                    ),
                  ),
                  const Text(
                    'Login to your account',
                    style: TextStyle(fontSize: 20.0, color: AppColors.darkBlue),
                  ),
                  SizedBox(
                    height: screenHeight * 0.050,
                  ),
                  CommonEmailTextField(
                    emailController: emailController,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(
                    height: screenHeight * 0.008,
                  ),
                  CommonPassTextField(
                    screenHeight: screenHeight,
                    passController: passController,
                    validator: FieldValidator.validatePassword,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgotten password?',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                  CommonButton(
                    btnText: isSubmit ? 'Logging In....' : 'Login',
                    btnFunction: _submit,
                  ),
                  SizedBox(
                    height: screenHeight * 0.210,
                  ),
                  const CommonBottomHeadline(
                    navigationPath: '/signup',
                    text1: "Don't have an account?",
                    text2: "Sign Up",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
