import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/widgets/empty_widget.dart';
import 'package:get/get.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyWidget(
        image: Const.illustration2,
        title: AppLocalizations.of(context)!.ouch_hungry,
        subtitle: AppLocalizations.of(context)!
            .just_stay_at_home_while_we_are_preparing_your_best_foods,
        labelButton: AppLocalizations.of(context)!.order_other_food,
        secondaryLabelButton: AppLocalizations.of(context)!.view_my_order,
        secondaryOnTap: () => Get.offAllNamed<dynamic>(Routes.order),
      ),
    );
  }
}
