import 'package:flutter/material.dart';
import 'package:rental_app/src/utils/colors.dart';

import '../utils/textstyles.dart';

class CommonCarouselDesign extends StatelessWidget {
  const CommonCarouselDesign({
    super.key,
    required this.imagePath,
    required this.carName,
    required this.carRent,
  });

  final String imagePath;
  final String carName;
  final String carRent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        Positioned(
          top: 12.0,
          right: 12.0,
          child: Container(
            alignment: Alignment.center,
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.darkLightBlue,
            ),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 18.0,
            ),
          ),
        ),
        Positioned(
          top: 7.0,
          left: 7.0,
          child: Image.asset(
            imagePath,
            width: 190,
          ),
        ),
        Positioned(
          right: 14.0,
          bottom: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(carName, style: style2),
              Text(carRent, style: style6),
            ],
          ),
        ),
      ],
    );
  }
}
