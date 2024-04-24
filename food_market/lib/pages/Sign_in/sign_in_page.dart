import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          buildBackground(),
          buildSocialSignIn(context),
          buildSignInWithEmail(context),
        ],
      ),
    );
  }

  Positioned buildBackground() {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Const.wallpaper),
            fit: BoxFit.fill,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black45,
                Colors.black,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Positioned buildSocialSignIn(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      bottom: Const.margin,
      left: Const.margin,
      right: Const.margin,
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                showToast(
                  msg: AppLocalizations.of(context)!.google_sign_in_tapped,
                  backgroundColor: const Color(0xFFDD4B39),
                );
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                side: const BorderSide(
                  color: Color(0xFFDD4B39),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Const.google, height: 30),
                  const SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context)!.google,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: const Color(0xFFDD4B39),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                showToast(
                  msg: AppLocalizations.of(context)!.facebook_sign_in_tapped,
                  backgroundColor: const Color(0xFF5C94D4),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color(0xFF5C94D4),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Const.facebook, height: 30),
                  const SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context)!.facebook,
                    style: theme.textTheme.titleMedium!.copyWith(
                      color: const Color(0xFF5C94D4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned buildSignInWithEmail(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      left: 0,
      right: 0,
      top: 150,
      bottom: 90,
      child: Center(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.food_shop,
              style: theme.textTheme.headlineLarge!.copyWith(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.log_in_to_continue,
              style: theme.textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Const.margin),
              child: MyRaisedButton(
                onTap: () => Get.offAllNamed<dynamic>(Routes.signinwithemail),
                label: AppLocalizations.of(context)!.log_in,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
