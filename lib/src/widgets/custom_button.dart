import 'package:flutter/material.dart';
import 'package:rental_app/src/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.btnText,
    required this.btnFunction,
  });

  final String btnText;
  final VoidCallback btnFunction;


  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: btnFunction,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(fontSize: 18.0),
        backgroundColor: AppColors.darkBlue,
        foregroundColor: Colors.white,
        fixedSize: Size(screenWidth * 0.999, screenHeight * 0.080),
      ),
      child: Text(btnText),
    );
  }
}
