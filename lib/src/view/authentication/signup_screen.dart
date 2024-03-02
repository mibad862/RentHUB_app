import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  CollectionReference users = FirebaseFirestore.instance.collection('user');


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
      UserCredential userCredential =
      await _firebase.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );

      await users.doc(userCredential.user!.uid).set({
        'full_name': nameController.text.toString(),
        'number': emailController.text.toString(),
      });


      // Navigate to the login screen upon successful account creation
      Navigator.pushReplacementNamed(
        context,
        '/login',
      );

    } on FirebaseAuthException catch (error) {
      String errorMessage = error.code.toString();

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(errorMessage),
      ));
    } on FirebaseException catch (error) {

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Firestore error: ${error.message}"),
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
                      btnText: isSubmit ? "Creating..." : "Create account",
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
      textCapitalization: TextCapitalization.words,
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
}
