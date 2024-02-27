import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/src/view/authentication/validator.dart';
import '../../widgets/custom_button.dart';
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
                      height: screenHeight * 0.013,
                    ),
                    _emailTextField(screenHeight),
                    SizedBox(
                      height: screenHeight * 0.013,
                    ),
                    _passTextField(screenHeight),
                    SizedBox(
                      height: screenHeight * 0.013,
                    ),
                    _confirmPassTextField(screenHeight),
                    SizedBox(
                      height: screenHeight * 0.018,
                    ),
                    CustomButton(
                      btnText: "Create account",
                      btnFunction: _submit,
                    ),
                    SizedBox(
                      height: screenHeight * 0.120,
                    ),
                    _buildGestureDetector(context),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _confirmPassTextField(double screenHeight) {
    return TextFormField(
      validator: (value) =>
          FieldValidator.validateConfirmPassword(value, passController.text),
      obscureText: !isConfirmPassVisible,
      controller: confirmPassController,
      decoration: InputDecoration(
        prefixIconColor: AppColors.darkLightBlue,
        suffixIconColor: AppColors.darkLightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.030),
        hintText: "Confirm Password",
        prefixIcon: const Icon(Icons.key),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isConfirmPassVisible = !isConfirmPassVisible;
            });
          },
          icon: isConfirmPassVisible
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
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

  Widget _buildGestureDetector(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, '/login'),
        child: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: "Already have an account?\t",
                style: TextStyle(
                  color: AppColors.color4,
                  fontSize: 17.0,
                )),
            TextSpan(
              text: "Sign In",
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 17.0,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _passTextField(double screenHeight) {
    return TextFormField(
      validator: FieldValidator.validatePassword,
      obscureText: !isPassVisible,
      controller: passController,
      decoration: InputDecoration(
        prefixIconColor: AppColors.darkLightBlue,
        suffixIconColor: AppColors.darkLightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.030),
        hintText: "Password",
        prefixIcon: const Icon(Icons.key),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPassVisible = !isPassVisible;
            });
          },
          icon: isPassVisible
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
    );
  }

  Widget _emailTextField(double screenHeight) {
    return TextFormField(
      validator: FieldValidator.validateEmail,
      controller: emailController,
      decoration: InputDecoration(
        prefixIconColor: AppColors.darkLightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.030),
        hintText: "Email Address",
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }

  void login() {
    setState(() {
      isSubmit = !isSubmit;
    });
  }
}
