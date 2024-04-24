import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/models/food.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:octo_image/octo_image.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    required this.food,
    this.isGrid = false,
    super.key,
  });

  final Food? food;
  final bool isGrid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isGrid ? 0.0 : 15.0),
      child: InkWell(
        onTap: () => Get.toNamed<dynamic>(Routes.fooddetail, arguments: food),
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: 190,
          child: Stack(
            children: [
              buildBodyCard(context),
              buildImage(context),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildImage(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Center(
        child: OctoImage(
          image: CachedNetworkImageProvider(food!.imagePath!),
          fit: BoxFit.contain,
          width: 140,
          errorBuilder: OctoError.icon(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }

  Positioned buildBodyCard(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      top: 60,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 85),
              Text(
                food!.name!,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const SizedBox(height: 15),
              Text(
                NumberFormat.currency(
                  symbol: r'$',
                  decimalDigits: 0,
                  locale: Const.localeUS,
                ).format(food!.price),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
                style: theme.textTheme.headlineLarge!
                    .copyWith(color: theme.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodVerticalCard extends StatelessWidget {
  const FoodVerticalCard({
    required this.food,
    super.key,
  });

  final Food food;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => Get.toNamed<dynamic>(Routes.fooddetail, arguments: food),
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Container(
          width: double.infinity,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name!,
                      maxLines: 2,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      NumberFormat.currency(
                        symbol: r'$',
                        decimalDigits: 0,
                        locale: Const.localeUS,
                      ).format(food.price),
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.headlineLarge!.copyWith(
                        color: theme.primaryColor,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              OctoImage(
                image: CachedNetworkImageProvider(food.imagePath!),
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
