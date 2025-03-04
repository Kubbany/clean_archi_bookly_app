import 'package:bookly_app/constants.dart';
import 'package:flutter/cupertino.dart';

abstract class AppStyles {
  static const styleSemiBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const styleNormal20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
  static const styleThick30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  );
  static const styleNormal14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const styleMedium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

//const TextStyle textStyle = TextStyle();
