import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/src/view/authentication/validator.dart';
import 'package:rental_app/src/widgets/common_bottom_headline.dart';
import 'package:rental_app/src/widgets/common_pass_textfield.dart';
import '../../widgets/common_button.dart';
import '../../utils/colors.dart';
import '../../widgets/common_email_textfield.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool isVisible = false;
  bool isSubmit = false;
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      final userCredentials = _firebase.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      if (_firebase.currentUser != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.email ?? 'Authentication failed.'),
      ));
    }
  }

  // @override
  // void dispose() {
  //   emailController.dispose();
  //   passController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.040),
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
                        style: TextStyle(
                            fontSize: 30.0, color: AppColors.darkBlue),
                      ),
                    ),
                    const Text(
                      'Login to your account',
                      style:
                          TextStyle(fontSize: 20.0, color: AppColors.darkBlue),
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
                      btnText: "Login",
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
                  ]),
            ),
          ),
        ),
      ),
    );
  }

}
