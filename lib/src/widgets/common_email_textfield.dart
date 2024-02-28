import 'package:flutter/material.dart';
import 'package:rental_app/src/utils/colors.dart';
import '../view/authentication/validator.dart';

class CommonEmailTextField extends StatelessWidget {
  const CommonEmailTextField({
    super.key,
    required this.emailController,
    required this.screenHeight,
  });

  final TextEditingController emailController;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
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
        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.032),
        hintText: "Email Address",
        prefixIcon: const Icon(Icons.email),
      ),
    );
  }
}