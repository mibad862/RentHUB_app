import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../view/authentication/validator.dart';

class CommonPassTextField extends StatefulWidget {
  final double screenHeight;
  final TextEditingController passController;
  final String? Function(String?)? validator;

  const CommonPassTextField({
    Key? key,
    required this.screenHeight,
    required this.passController,
    required this.validator,
  }) : super(key: key);

  @override
  CommonPassTextFieldState createState() => CommonPassTextFieldState();
}

class CommonPassTextFieldState extends State<CommonPassTextField> {
  bool isPassVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      obscureText: !isPassVisible,
      controller: widget.passController,
      decoration: InputDecoration(
        prefixIconColor: AppColors.darkLightBlue,
        suffixIconColor: AppColors.darkLightBlue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding:
        EdgeInsets.symmetric(vertical: widget.screenHeight * 0.030),
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
}
