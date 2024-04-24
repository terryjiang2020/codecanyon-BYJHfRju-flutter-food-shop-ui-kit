import 'package:flutter/material.dart';

import 'package:food_market/helpers/colors.dart';

class MyRaisedButton extends StatelessWidget {
  final void Function()? onTap;
  final String? label;
  final double height;
  final double width;
  final Color color;
  final Color labelColor;

  const MyRaisedButton({
    required this.onTap,
    required this.label,
    this.width = double.infinity,
    this.height = 45.0,
    this.color = ColorLight.primary,
    this.labelColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height,
      // Raised Button Deprecated
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(backgroundColor: color),
        child: Text(
          label!,
          style: theme.textTheme.labelMedium!.copyWith(color: labelColor),
        ),
      ),
    );
  }
}
