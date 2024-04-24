import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_market/helpers/constants.dart';
import 'package:food_market/helpers/routes.dart';
import 'package:food_market/pages/on_boarding/local_data/onboarding_model.dart';
import 'package:food_market/widgets/custom_elevated_button.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _currentIndexPage = 0;
  PageController? _pageController;

  List<OnBoardingModel> onBoardingList(BuildContext context) => [
        OnBoardingModel(
          title: AppLocalizations.of(context)!.fresh_food,
          subtitle: AppLocalizations.of(context)!
              .we_make_it_simple_to_find_the_food_you_crave_enter_your_address_and_let_us_do_the_rest,
          image: Const.onBoardingImage1,
        ),
        OnBoardingModel(
          title: AppLocalizations.of(context)!.fast_delivery,
          subtitle: AppLocalizations.of(context)!
              .when_you_order_we_will_hook_you_up_with_exclusive_coupons_specials_and_rewards,
          image: Const.onBoardingImage2,
        ),
        OnBoardingModel(
          title: AppLocalizations.of(context)!.easy_payment,
          subtitle: AppLocalizations.of(context)!
              .we_make_food_ordering_fast_simple_and_free_no_matter_if_you_order_online_or_cash,
          image: Const.onBoardingImage3,
        ),
      ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndexPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          skipButton(context),
          mainSection(context),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Center(
              child: DotsIndicator(
                dotsCount: onBoardingList(context).length,
                position: _currentIndexPage,
                decorator: DotsDecorator(
                  activeColor: Theme.of(context).primaryColor,
                  activeSize: const Size(18, 9),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          getStartedButton(),
        ],
      ),
    );
  }

  Positioned skipButton(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      top: 50,
      right: Const.margin,
      child: InkWell(
        onTap: () => Get.offAllNamed<dynamic>(Routes.signin),
        child: Text(
          '${AppLocalizations.of(context)!.skip} >>',
          style:
              theme.textTheme.titleLarge!.copyWith(color: theme.primaryColor),
        ),
      ),
    );
  }

  Positioned mainSection(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      top: 100,
      left: Const.margin,
      right: Const.margin,
      bottom: 100,
      child: PageView.builder(
        controller: _pageController,
        itemCount: onBoardingList(context).length,
        onPageChanged: (value) {
          setState(() {
            _currentIndexPage = value;
          });
        },
        itemBuilder: (context, index) {
          final item = onBoardingList(context)[index];
          return Column(
            children: [
              Image.asset(item.image!),
              const SizedBox(height: 15),
              Text(
                item.title!,
                style: theme.textTheme.headlineLarge!.copyWith(fontSize: 25),
              ),
              const SizedBox(height: 15),
              Text(
                item.subtitle!,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }

  Positioned getStartedButton() {
    return Positioned(
      bottom: 50,
      left: Const.margin,
      right: Const.margin,
      height: 45,
      child: MyRaisedButton(
        label: AppLocalizations.of(context)!.get_started,
        onTap: () {
          if (_currentIndexPage == 2) {
            Get.offAllNamed<dynamic>(Routes.signin);
          } else {
            _pageController!.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        },
      ),
    );
  }
}
