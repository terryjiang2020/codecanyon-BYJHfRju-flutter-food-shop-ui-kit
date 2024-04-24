import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:food_market/helpers/colors.dart';
import 'package:food_market/pages/favorite/favorite_page.dart';
import 'package:food_market/pages/home/home_page.dart';
import 'package:food_market/pages/order/order_page.dart';
import 'package:food_market/pages/profile/profile_page.dart';
import 'package:food_market/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class BottomNavPage extends StatefulWidget {
  final int initialIndex;

  const BottomNavPage({super.key, this.initialIndex = 0});
  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    refreshTabController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProv = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        children: const [
          HomePage(),
          FavoritePage(),
          OrderPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        backgroundColor:
            themeProv.isDarkTheme! ? ColorDark.card : ColorLight.background,
        onItemSelected: (value) {
          setState(() {
            _selectedIndex = value;
            _pageController!.animateToPage(
              value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Feather.home),
            title: Text(
              AppLocalizations.of(context)!.home,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: themeProv.isDarkTheme!
                    ? ColorDark.fontTitle
                    : ColorLight.primary,
              ),
            ),
            activeColor: theme.primaryColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Feather.heart),
            title: Text(
              AppLocalizations.of(context)!.favorite,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: themeProv.isDarkTheme!
                    ? ColorDark.fontTitle
                    : ColorLight.primary,
              ),
            ),
            activeColor: theme.primaryColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Feather.shopping_bag),
            title: Text(
              AppLocalizations.of(context)!.order,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: themeProv.isDarkTheme!
                    ? ColorDark.fontTitle
                    : ColorLight.primary,
              ),
            ),
            activeColor: theme.primaryColor,
          ),
          BottomNavyBarItem(
            icon: const Icon(Feather.user),
            title: Text(
              AppLocalizations.of(context)!.profile,
              style: theme.textTheme.headlineSmall!.copyWith(
                color: themeProv.isDarkTheme!
                    ? ColorDark.fontTitle
                    : ColorLight.primary,
              ),
            ),
            activeColor: theme.primaryColor,
          ),
        ],
      ),
    );
  }

  void refreshTabController() {
    setState(() {
      _selectedIndex = widget.initialIndex;
    });
  }
}
