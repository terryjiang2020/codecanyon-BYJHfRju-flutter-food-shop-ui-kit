import 'package:flutter/material.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/models/food.dart';
import 'package:food_market/widgets/food_card.dart';

class PopularTab extends StatelessWidget {
  const PopularTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 270,
          child: ListView.builder(
            itemCount: mockFoodList.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: Const.margin),
            itemBuilder: (context, index) {
              final food = mockFoodList[index];
              return FoodCard(food: food);
            },
          ),
        ),
      ],
    );
  }
}
