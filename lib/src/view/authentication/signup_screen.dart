import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/src/view/authentication/validator.dart';
import 'package:rental_app/src/widgets/common_bottom_headline.dart';
import 'package:rental_app/src/widgets/common_email_textfield.dart';
import 'package:rental_app/src/widgets/common_pass_textfield.dart';
import '../../widgets/common_button.dart';
import '../../utils/colors.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  static TextEditingController nameController = TextEditingController();
  bool isPassVisible = false;
  bool isConfirmPassVisible = false;
  bool isSubmit = false;

  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    try {
      final userCredentials = _firebase.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      if (_firebase.currentUser != null) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'email-already-in-use') {}
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.email ?? 'Authentication failed.'),
      ));
    }
  }

  @override
  // void dispose() {
  //   emailController.dispose();
  //   passController.dispose();
  //   confirmPassController.dispose();
  //   nameController.dispose();
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
                      padding: EdgeInsets.only(top: screenHeight * 0.100),
                      child: const Text(
                        "Let's get started",
                        style: TextStyle(
                            fontSize: 30.0, color: AppColors.darkBlue),
                      ),
                    ),
                    const Text(
                      'Create your new account',
                      style:
                          TextStyle(fontSize: 20.0, color: AppColors.darkBlue),
                    ),
                    SizedBox(
                      height: screenHeight * 0.050,
                    ),
                    _nameTextField(screenHeight),
                    SizedBox(
                      height: screenHeight * 0.008,
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
                    SizedBox(
                      height: screenHeight * 0.008,
                    ),
                    CommonPassTextField(
                      screenHeight: screenHeight,
                      passController: confirmPassController,
                      validator: (value) {
                        return FieldValidator.validateConfirmPassword(
                            value, passController.text);
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.018,
                    ),
                    CommonButton(
                      btnText: "Create account",
                      btnFunction: _submit,
                    ),
                    SizedBox(
                      height: screenHeight * 0.130,
                    ),
                    const CommonBottomHeadline(
                      navigationPath: '/login',
                      text1: "Already have an account",
                      text2: "Sign In",
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameTextField(double screenHeight) {
    return TextFormField(
      validator: FieldValidator.validateFullname,
      controller: nameController,
      decoration: InputDecoration(
        prefixIconColor: AppColors.darkLightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.030),
        hintText: "Full Name",
        prefixIcon: const Icon(Icons.person),
      ),
    );
  }

  void login() {
    setState(() {
      isSubmit = !isSubmit;
    });
  }
}
