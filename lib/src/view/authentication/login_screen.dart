import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rental_app/src/view/authentication/validator.dart';
import '../../widgets/custom_button.dart';
import '../../utils/colors.dart';

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
                    _emailTextField(screenHeight),
                    SizedBox(
                      height: screenHeight * 0.013,
                    ),
                    _passTextField(screenHeight),
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
                    CustomButton(
                      btnText: "Login",
                      btnFunction: _submit,
                    ),
                    SizedBox(
                      height: screenHeight * 0.200,
                    ),
                    _buildGestureDetector(context),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGestureDetector(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/signup');
        },
        child: RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: "Don't have an account?\t",
                style: TextStyle(
                  color: AppColors.color4,
                  fontSize: 17.0,
                )),
            TextSpan(
              text: "Sign Up",
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
      obscureText: !isVisible,
      controller: passController,
      decoration: InputDecoration(
        prefixIconColor: AppColors.darkLightBlue,
        suffixIconColor: AppColors.darkLightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.034),
        hintText: "Password",
        prefixIcon: const Icon(Icons.key),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: isVisible
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
        ),
      ),
    );
  }

  Widget _emailTextField(double screenHeight) {
    return TextFormField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textCapitalization: TextCapitalization.none,
      validator: FieldValidator.validateEmail,
      controller: emailController,
      decoration: InputDecoration(
        prefixIconColor: AppColors.darkLightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.034),
        hintText: "Email Address",
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }
}
