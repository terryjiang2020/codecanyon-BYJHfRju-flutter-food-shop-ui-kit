import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: theme.primaryColor,
          onPressed: backOnTap,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Const.margin),
        key: const PageStorageKey('forgot_password_page'),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.forgot_your_password,
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              AppLocalizations.of(context)!
                  .enter_your_registered_email_below_to_receive_password_reset_authentication,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 25),
            Image.asset(
              Const.email,
              width: MediaQuery.of(context).size.width / 1.5,
            ),
            const SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.email_address,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Const.radius),
                  borderSide: BorderSide(
                    color: theme.disabledColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Const.radius),
                  borderSide: BorderSide(
                    color: theme.disabledColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.remember_password}?',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: backOnTap,
                  child: Text(
                    AppLocalizations.of(context)!.log_in,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            MyRaisedButton(
              onTap: sendVerificationCodeOnTap,
              label: AppLocalizations.of(context)!.send,
            ),
          ],
        ),
      ),
    );
  }

  void backOnTap() {
    Get.back<dynamic>();
  }

  void sendVerificationCodeOnTap() {}
}
