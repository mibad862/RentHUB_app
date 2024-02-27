import 'package:flutter/cupertino.dart';

class Sizes {
  static double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}