import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_market/helpers/colors.dart';

class Const {
  /// [String] Constants
  // C
  static const String cod = 'assets/cod.png';
  // E
  static const String empty = 'assets/empty.png';
  // F
  static const String facebook = 'assets/facebook_sign_in.png';
  // G
  static const String google = 'assets/google_sign_in.png';
  // I
  static const String illustration1 = 'assets/illustration1.png';
  static const String illustration2 = 'assets/illustration2.png';
  static const String email = 'assets/email.png';
  // L
  static const String localeUS = 'en-US';
  static const String logo = 'assets/foodbeast.png';
  // M
  static const String mockProfileImage =
      'https://i.pinimg.com/564x/d4/a7/28/d4a72868e14074fce5f1e72f2e4f727c.jpg';
  // O
  static const String onBoardingImage1 = 'assets/onboarding1.png';
  static const String onBoardingImage2 = 'assets/onboarding2.png';
  static const String onBoardingImage3 = 'assets/onboarding3.png';
  // P
  static const String paypal = 'assets/paypal.png';
  // W
  static const String wallpaper = 'assets/wallpaper.jpg';

  // Double
  static const double margin = 18;
  static const double radius = 8;
}

Future<dynamic> showToast({
  required String msg,
  Color? backgroundColor,
  Color? textColor,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16,
    gravity: ToastGravity.CENTER,
    backgroundColor: Colors.grey.withOpacity(.5),
    textColor: ColorLight.fontTitle,
  );
}
