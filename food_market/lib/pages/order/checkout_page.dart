import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_market/helpers/colors.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/models/food.dart';
import 'package:food_market/models/order.dart';
import 'package:food_market/providers/theme_provider.dart';
import 'package:food_market/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    final food = Get.arguments as Food;
    final theme = Theme.of(context);
    final themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  iconSize: 18,
                  onPressed: backOnTap,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Const.radius),
                color: themeProv.isDarkTheme! ? ColorDark.card : Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.item_ordered,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Const.radius),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(food.imagePath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              food.name!,
                              maxLines: 2,
                              style: theme.textTheme.headlineSmall!
                                  .copyWith(height: 1),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              NumberFormat.currency(
                                symbol: r'$',
                                decimalDigits: 0,
                                locale: Const.localeUS,
                              ).format(food.quantity * food.price!),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.headlineSmall!
                                  .copyWith(color: theme.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        '${'${food.quantity} '}${AppLocalizations.of(context)!.items}',
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.detail_transaction,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  buildCheckoutDetail(
                    theme,
                    title: food.name!,
                    trailing: food.quantity * food.price!,
                  ),
                  const SizedBox(height: 5),
                  buildCheckoutDetail(
                    theme,
                    title: AppLocalizations.of(context)!.shipping_cost,
                    trailing: 5,
                  ),
                  const SizedBox(height: 5),
                  buildCheckoutDetail(
                    theme,
                    title: AppLocalizations.of(context)!.total,
                    trailing: food.quantity * food.price! + 5,
                    isTotal: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Const.radius),
                color: themeProv.isDarkTheme! ? ColorDark.card : Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.deliver_to}:',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 15),
                  buildUserDetail(
                    theme,
                    title: AppLocalizations.of(context)!.name,
                    trailing: 'Jessica Veranda',
                  ),
                  const SizedBox(height: 5),
                  buildUserDetail(
                    theme,
                    title: AppLocalizations.of(context)!.phone_number,
                    trailing: '+6281345071707',
                  ),
                  const SizedBox(height: 5),
                  buildUserDetail(
                    theme,
                    title: AppLocalizations.of(context)!.address,
                    trailing: 'Jl. S. Parman',
                  ),
                  const SizedBox(height: 5),
                  buildUserDetail(
                    theme,
                    title: AppLocalizations.of(context)!.city,
                    trailing: 'Jakarta Pusat',
                  ),
                ],
              ),
            ),
            const Spacer(),
            MyRaisedButton(
              onTap: checkoutOnTap,
              label: AppLocalizations.of(context)!.checkout_now,
            ),
            const SizedBox(height: Const.margin),
          ],
        ),
      ),
    );
  }

  Row buildCheckoutDetail(
    ThemeData theme, {
    required String title,
    int? trailing,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme.textTheme.bodyLarge),
        Text(
          NumberFormat.currency(
            symbol: r'$',
            decimalDigits: 0,
            locale: Const.localeUS,
          ).format(trailing),
          overflow: TextOverflow.clip,
          textAlign: TextAlign.left,
          style: theme.textTheme.titleLarge!.copyWith(
            color: isTotal ? theme.primaryColor : null,
            fontWeight: isTotal ? FontWeight.bold : null,
          ),
        ),
      ],
    );
  }

  Row buildUserDetail(
    ThemeData theme, {
    required String title,
    required String trailing,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: theme.textTheme.bodyLarge),
        Text(trailing, style: theme.textTheme.titleLarge),
      ],
    );
  }

  void backOnTap() {
    Get.back<dynamic>();
  }

  void checkoutOnTap() {
    final food = Get.arguments as Food;
    final randomId = Random();
    Get.offNamed<dynamic>(Routes.ordersuccess);
    mockOrderList.add(
      Order(
        id: randomId.nextInt(1000),
        food: food,
        orderTime: DateTime.now(),
      ),
    );
  }
}
