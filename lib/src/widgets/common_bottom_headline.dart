import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CommonBottomHeadline extends StatelessWidget {
  const CommonBottomHeadline({
    Key? key,
    required this.navigationPath,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String navigationPath;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, navigationPath),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: text1,
              style: const TextStyle(
                color: AppColors.color4,
                fontSize: 17.0,
              ),
            ),
            TextSpan(
              text: "\t$text2",
              style: const TextStyle(
                color: AppColors.darkBlue,
                fontSize: 17.0,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
