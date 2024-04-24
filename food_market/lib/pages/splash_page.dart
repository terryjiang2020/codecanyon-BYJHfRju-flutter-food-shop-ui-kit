
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/providers/theme_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  
  const SplashPage({super.key });
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  void startSplashScreen()  {
    Timer(const Duration(seconds: 3), navigateToNextScreen);
  }

  void navigateToNextScreen() {
    Get.offAllNamed<dynamic>(Routes.onboarding);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
    
    getCurrentTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Image.asset(Const.logo),
      ),
    );
  }
  
  Future<dynamic> getCurrentTheme() async {
    final themeProv = Provider.of<ThemeProvider>(context, listen: false);
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getBool('darkTheme');

    themeProv.isDarkTheme = theme;
  }
}
