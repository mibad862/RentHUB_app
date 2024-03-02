import 'package:flutter/material.dart';
import 'package:rental_app/src/widgets/common_carousel_design.dart';

import '../utils/textstyles.dart';

List<Widget> cItems = [
  const CommonCarouselDesign(
    imagePath: 'assets/images/carousel_images/honda-civic.png',
    carName: 'Honda Civic RS Turbo',
    carRent: 'PKR 50000 /month',
  ),
  const CommonCarouselDesign(
    imagePath: 'assets/images/carousel_images/kia-stonic.png',
    carName: 'Kia Stonic Quantum',
    carRent: 'PKR 3500 /day',
  ),
  const CommonCarouselDesign(
    imagePath: 'assets/images/carousel_images/benelli.png',
    carName: 'Benelli TNT 600',
    carRent: 'PKR 30000 /month',
  ),
];
