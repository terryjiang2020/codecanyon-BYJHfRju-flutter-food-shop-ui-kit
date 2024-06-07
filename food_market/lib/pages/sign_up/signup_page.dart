import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_market/helpers/clippers.dart';
import 'package:food_market/helpers/colors.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        key: const PageStorageKey('sign_up_page'),
        child: Column(
          children: [
            buildMainSection(
              context,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.food_shop,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    AppLocalizations.of(context)!.register,
                    style: theme.textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 55,
                    height: 2,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 25),
                  buildTextField(
                    context,
                    label: AppLocalizations.of(context)!.full_name,
                    icon: Feather.user,
                    hintText:
                        AppLocalizations.of(context)!.enter_your_full_name,
                  ),
                  const SizedBox(height: 25),
                  buildTextField(
                    context,
                    label: AppLocalizations.of(context)!.email_address,
                    icon: Feather.mail,
                    hintText:
                        AppLocalizations.of(context)!.enter_your_email_address,
                  ),
                  const SizedBox(height: 25),
                  buildTextField(
                    context,
                    label: AppLocalizations.of(context)!.password,
                    icon: Feather.lock,
                    hintText: AppLocalizations.of(context)!.enter_your_password,
                    isPassword: true,
                  ),
                  const SizedBox(height: 25),
                  buildTextField(
                    context,
                    label: AppLocalizations.of(context)!.password,
                    icon: Feather.lock,
                    hintText: AppLocalizations.of(context)!.enter_your_password,
                    isPassword: true,
                  ),
                ],
              ),
              button: MyRaisedButton(
                label: AppLocalizations.of(context)!.continuee,
                color: Colors.black,
                onTap: () => Get.toNamed<dynamic>(Routes.signupaddress),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.already_have_an_account,
                  style: theme.textTheme.headlineSmall,
                ),
                InkWell(
                  onTap: () => Get.back<dynamic>(),
                  child: Text(
                    AppLocalizations.of(context)!.log_in,
                    style: theme.textTheme.headlineSmall!
                        .copyWith(color: ColorLight.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  SizedBox buildMainSection(
    BuildContext context, {
    required Widget button,
    Widget? child,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 640,
      child: Stack(
        children: [
          ClipPath(
            clipper: BottomContainerClipper(),
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                Const.margin,
                50,
                Const.margin,
                0,
              ),
              color: ColorLight.primary,
              child: child,
            ),
          ),
          Positioned(
            left: 50,
            right: 50,
            bottom: 0,
            child: button,
          ),
        ],
      ),
    );
  }

  Column buildTextField(
    BuildContext context, {
    required String label,
    String? hintText,
    IconData? icon,
    bool isPassword = false,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            label,
            style: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        TextField(
          cursorColor: Colors.white,
          obscureText: isPassword,
          style: theme.textTheme.titleMedium!.copyWith(color: Colors.white),
          keyboardType:
              isPassword ? TextInputType.text : TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodyMedium!.copyWith(
              color: Colors.white70,
            ),
            contentPadding: EdgeInsets.only(top: isPassword ? 15.0 : 0.0),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            suffixIcon: isPassword
                ? InkWell(
                    onTap: iconVisibilityOnTap,
                    child: Icon(
                      _obscureText ? Feather.eye_off : Feather.eye,
                      color: Colors.white70,
                    ),
                  )
                : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void iconVisibilityOnTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void googleSignInOnTap() {
    showToast(
      msg: AppLocalizations.of(context)!.google_sign_in_tapped,
      backgroundColor: const Color(0xFFDD4B39),
    );
  }

  void facebookSignInOnTap() {
    showToast(
      msg: AppLocalizations.of(context)!.facebook_sign_in_tapped,
      backgroundColor: const Color(0xFF5C94D4),
    );
  }
}
