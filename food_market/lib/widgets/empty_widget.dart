import 'package:flutter/material.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    required this.image,
    required this.subtitle,
    required this.title,
    required this.labelButton,
    this.secondaryLabelButton,
    this.secondaryOnTap,
    super.key,
  });

  final String image;
  final String title;
  final String subtitle;
  final String labelButton;
  final String? secondaryLabelButton;
  final void Function()? secondaryOnTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: MediaQuery.of(context).size.width / 2,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height: 20),
          Text(title, style: theme.textTheme.headlineLarge),
          const SizedBox(height: 15),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          MyRaisedButton(
            onTap: () => Get.offAllNamed<dynamic>(Routes.home),
            label: labelButton,
          ),
          const SizedBox(height: 10),
          if (secondaryLabelButton != null)
            MyRaisedButton(
              onTap: secondaryOnTap,
              label: secondaryLabelButton,
              color: const Color(0xFF8D92A3),
            )
          else
            Container(),
        ],
      ),
    );
  }
}
