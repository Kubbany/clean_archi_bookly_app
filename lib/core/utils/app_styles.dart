import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static const styleSemiBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const styleNormal20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );
  static const styleThick30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
    color: Colors.white,
  );
  static const styleNormal14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static const styleMedium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

//const TextStyle textStyle = TextStyle();
